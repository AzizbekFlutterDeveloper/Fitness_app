import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitness_app/core/constants/enums/locale_kays_enum.dart';
import 'dart:developer' as debugger;

import 'package:fitness_app/core/data/mashq_data/mashq_data.dart';
import 'package:fitness_app/core/init/cache/cache_manager.dart';
import 'package:get_storage/get_storage.dart';

class FirebaseServise {
  final fireBase = FirebaseFirestore.instance;
  dynamic datas = '';
  String emailT = GetStorage().read(PreferenceKeys.EMAIL.toString())?? " ";

  Future setUserInfo(
      {required String age,
      required String name,
      required String email,
      required String datetime,
      required String gender,
      required String height,
      required String job,
      required String weight}) async {
    emailT = email;
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

  Future<dynamic> getData() async {
    print(emailT);
    final DocumentReference document =
        FirebaseFirestore.instance.collection("Users").doc(emailT);
    var dd = emailT;
    await document.get().then<dynamic>((DocumentSnapshot snapshot) async {
      datas = snapshot.data;
    });

    return datas;
  }

  getDataT() async {
    //use a Async-await function to get the data
    final data = await FirebaseFirestore.instance
        .collection("Users")
        .doc(emailT)
        .get(); //get the data

    return data;
  }

  Future<Map<dynamic, dynamic>> fetchData() async {
    final firestore = FirebaseFirestore.instance;
    late Map<String, dynamic> data;

    try {
      await firestore.collection('Users').doc(emailT).get().then(
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
    print("Firebasega jonatilgan email ${GetStorage().read(PreferenceKeys.EMAIL.toString())} $emailT");
    try {
      var data = await FirebaseFirestore.instance
          .collection('Users')
          .doc(emailT)
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
      print(e);
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
