import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitness_app/service/firebase_auth/firebase_auth_service.dart';

class FirebaseServise {
  final fireBase = FirebaseFirestore.instance;
  dynamic datas = '';
  String emailT = '';

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
    final DocumentReference document =
        FirebaseFirestore.instance.collection("Users").doc('sss@gmail.com');
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
        .doc('sss@gmail.com')
        .get(); //get the data
    
    
    return data;
  }

  Future<Map<dynamic, dynamic>> fetchData() async {
  final _firestore = FirebaseFirestore.instance;
  late Map<dynamic, dynamic> data;

  try {
    await _firestore
        .collection('Users')
        .limit(1)
        .get()
        .then((value) => data = value.docs.first.data());
  } catch (e) {
    print(e);
  }
  return data;
}
  
}
