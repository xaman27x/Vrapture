import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final Stream<User?> authStateChanges =
      FirebaseAuth.instance.authStateChanges();

  User? get currUser => _firebaseAuth.currentUser;

  Future<void> signinWithEmailandPassWord({
    required String email,
    required String password,
  }) async {
    await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  Future<void> createUserWithEmailandPassword({
    required String email,
    required String password,
  }) async {
    await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  Future<void> signInWithGoogle() async {
    await _firebaseAuth.signInWithProvider(
      GoogleAuthProvider(),
    );
  }

  Future<void> forgotPassword({
    required String email,
  }) async {
    await _firebaseAuth.sendPasswordResetEmail(
      email: email,
    );
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
