import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_app/core/init/cache/cache_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/constants/navigation_const/navigation_const.dart';

class FirebaseAuthServise {
  final auth = FirebaseAuth.instance;

  Future signInWithGoogle(context) async {
    try {
      final GoogleSignInAccount? googleUser =
          await GoogleSignIn(scopes: <String>['email']).signIn();

      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;

      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
        accessToken: googleAuth.accessToken,
      );

      // Navigator.pushNamed(context, NavigationConst.GENDER);

      return await FirebaseAuth.instance.signInWithCredential(credential).then(
          (value) => Navigator.of(context).pushNamedAndRemoveUntil(
              NavigationConst.GENDER, (route) => false));
    } on PlatformException catch (e) {
      print('Failed with error code: ${e.code}');
      print(e.message);

      errorBox(context, e.code);
    }
  }

  void createUser(context, String email, String password, String name) async {
    LocaleManeger().PrefSetString('email', email);
    LocaleManeger().PrefSetString('name', name);

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
    showDialog(
        context: context,
        builder: ((context) {
          return AlertDialog(
            title: const Text('error'),
            content: Text(e.toString()),
          );
        }));
  }
}
