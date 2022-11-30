import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:developer' as debugger;
import 'package:shared_preferences/shared_preferences.dart';

class FirebaseServise {
  final fireBase = FirebaseFirestore.instance;
  dynamic datas = '';

  Future setUserInfo(
      {required String age,
      required String name,
      required String email,
      required String datetime,
      required String gender,
      required String height,
      required String job,
      required String weight}) async {
    return await fireBase.collection('Users').doc(email).set({
      'age': age,
      'datetime': datetime,
      'email': email,
      'gender': gender,
      'height': height,
      'job': job,
      'name': name,
      'weight': weight,
    });
  }

  Future updateUserInf({
    required String name,
    required String email,
  }) async {
     SharedPreferences pref = await SharedPreferences.getInstance();
     String? emailee = pref.getString('email');
   
   var fireBas = FirebaseFirestore.instance;
     await fireBas.collection('Users').doc(emailee).update({
      'email': email,
      'name': name,
    });
  }
  

  // Future<dynamic> getData() async {
  //   print(emailT);
  //   final DocumentReference document =
  //       FirebaseFirestore.instance.collection("Users").doc('sss@gmail.com');
  //   var dd = emailT;
  //   await document.get().then<dynamic>((DocumentSnapshot snapshot) async {
  //     datas = snapshot.data;
  //   });

  //   return datas;
  // }

  getDataT() async {
    //use a Async-await function to get the data
    final data = await FirebaseFirestore.instance
        .collection("Users")
        .doc('sss@gmail.com')
        .get(); //get the data

    return data;
  }

  Future<Map<dynamic, dynamic>> fetchData() async {
    final firestore = FirebaseFirestore.instance;
    late Map<String, dynamic> data;

    try {
      await firestore.collection('Users').doc('ddd').get().then(
        (DocumentSnapshot doc) {
          print(doc.toString());
          data = doc.data() as Map<String, dynamic>;
          debugger.log('$data');
          return doc.data() as Map<String, dynamic>;
        },
        onError: (e) => debugger.log("Error getting document: $e"),
      );
    } catch (e) {
      print(e);
    }
    return Map();
  }

  Future<Map<String, dynamic>> fetchUserData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? email = pref.getString('email');
    // email = null;
    try {
      var data = await FirebaseFirestore.instance
          .collection('Users')
          .doc(email ?? 'sss@gmail.com')
          .get()
          .then(
        (DocumentSnapshot doc) {
          final data = doc.data() as Map<String, dynamic>;
          return data;
        },
        onError: (e) => print("Error getting document: $e"),
      );
      return data;
    } catch (e) {
      return Map();
    }
  }

  Future getExercises(String category) async {
    try {
      var snapshots = await FirebaseFirestore.instance
          .collection(category)
          .orderBy('id')
          .get();
      debugger.log('@@@@ data  ${snapshots.docs}');

      return snapshots;
    } catch (e) {
      debugger.log('Error $e');
    }
  }
}
