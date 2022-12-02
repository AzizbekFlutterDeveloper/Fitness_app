import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_app/core/constants/enums/locale_kays_enum.dart';
import 'package:fitness_app/core/init/cache/cache_manager.dart';
import 'package:fitness_app/service/exercisea_service/set_user_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/constants/navigation_const/navigation_const.dart';

class FirebaseAuthServise {
  final auth = FirebaseAuth.instance;
  final box = GetStorage();

  Future signInWithGoogle(context) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    try {
      final GoogleSignInAccount? googleUser =
          await GoogleSignIn(scopes: <String>['email']).signIn();

      pref.setString('email', googleUser?.email ?? '');
      pref.setString('name', googleUser?.displayName ?? '');
      box.write(PreferenceKeys.NAME.toString(), googleUser?.displayName ?? '');

      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;

      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
        accessToken: googleAuth.accessToken,
      );

      // Navigator.pushNamed(context, NavigationConst.GENDER);

      return await FirebaseAuth.instance
          .signInWithCredential(credential)
          .then((value) {
        DateTime now = DateTime.now();
        DateTime date = DateTime(now.year, now.month, now.day);
        String? name = pref.getString('name');
        String? email = pref.getString('email');

        FirebaseServise().setUserInfo(
            age: 'age',
            name: name ?? '',
            email: email ?? '',
            datetime: date.toString(),
            gender: 'gender',
            height: 'height',
            job: 'job',
            weight: 'weight');
        Navigator.of(context)
            .pushNamedAndRemoveUntil(NavigationConst.GENDER, (route) => false);
      });
    } on PlatformException catch (e) {
      print('Failed with error code: ${e.code}');
      print(e.message);

      errorBox(context, e.code);
    }
  }

  void createUser(context, String email, String password, String name) async {
    LocaleManeger().PrefSetString('email', email);
    LocaleManeger().PrefSetString('name', name);
    box.write(PreferenceKeys.NAME.toString(), name);

    try {
      await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => Navigator.of(context).pushNamedAndRemoveUntil(
              NavigationConst.GENDER, (route) => false));
    } on FirebaseAuthException catch (e) {
      print('Failed with error code: ${e.code}');
      print(e.message);

      errorBox(context, e.code);
    }
  }

  void loginUser(
    context,
    email,
    password,
  ) async {
    try {
      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) => Navigator.of(context).pushNamedAndRemoveUntil(
              NavigationConst.GENDER, (route) => false));
    } on FirebaseAuthException catch (e) {
      print('Failed with error code: ${e.code}');

      errorBox(context, e.code);
    }
  }

  void signOut(context) async {
    try {
      await auth.signOut();
    } catch (e) {
      errorBox(context, e);
    }
  }

  void errorBox(context, e) {
    Fluttertoast.showToast(
      msg: e.toString(),
    );
    // showDialog(
    //     context: context,
    //     builder: ((context) {
    //       return AlertDialog(
    //         title: const Text('error'),
    //         content: Text(e.toString()),
    //       );
    //     }));
  }
}
