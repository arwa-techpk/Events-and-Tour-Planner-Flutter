import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:terhal/ui/screens/pref_manager.dart';

abstract class AuthBase {
  User get currentUser;

  Stream<User> authStateChanges();

  Future<User> signInWithEmailAndPassword(String email, String password);

  Future<User> createUserWithEmailAndPassword(String email, String password);
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
    await Get.find<PrefManager>().save('email', userCredential.user.email);
    await Get.find<PrefManager>().save('user', userCredential.user.uid);
    return userCredential.user;
  }

  @override
  Future<User> createUserWithEmailAndPassword(
      String email, String password) async {
    final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return userCredential.user;
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
