import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:terhal/ui/screens/pref_manager.dart';

abstract class AuthBase {
  User get currentUser;

  Stream<User> authStateChanges();

  Future<User> signInWithEmailAndPassword(String email, String password);
  Future<Void> resetPassword(String email, BuildContext context);

  Future<User> createUserWithEmailAndPassword(
      String email, String password, String name);
  Future<void> signOut();
}

class Auth implements AuthBase {
  final _firebaseAuth = FirebaseAuth.instance;

  @override
  Stream<User> authStateChanges() => _firebaseAuth.authStateChanges();

  @override
  User get currentUser => _firebaseAuth.currentUser;

  @override
  Future<User> signInWithEmailAndPassword(String email, String password) async {
    final userCredential = await _firebaseAuth.signInWithCredential(
      EmailAuthProvider.credential(email: email, password: password),
    );
    await Get.find<PrefManager>()
        .save('email', userCredential.user.displayName);
    await Get.find<PrefManager>().save('user', userCredential.user.uid);
    return userCredential.user;
  }

  @override
  Future<User> createUserWithEmailAndPassword(
      String email, String password, String name) async {
    final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    User user = userCredential.user;
    await user.updateDisplayName(name);
    await Get.find<PrefManager>().save('email', name);
    await Get.find<PrefManager>().save('user', userCredential.user.uid);
    return userCredential.user;
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  @override
  Future<Void> resetPassword(String email, BuildContext context) async {
    // TODO: implement resetPassword
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
     
      Fluttertoast.showToast(msg:'Password reset email is sent to your email');
     
    } catch (e) {
      Fluttertoast.showToast(msg:e.toString(),toastLength: Toast.LENGTH_LONG);
     
    }
  }
}
