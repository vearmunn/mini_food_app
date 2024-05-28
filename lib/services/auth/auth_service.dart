import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  // get instance of firebase auth
  final FirebaseAuth _firebasAuth = FirebaseAuth.instance;

  // get current user
  User? getCurrentUser() {
    _firebasAuth.currentUser;
    return null;
  }

  // sign in
  Future<UserCredential> signIn(String email, String password) async {
    try {
      UserCredential userCredential = await _firebasAuth
          .signInWithEmailAndPassword(email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e);
    }
  }

  // sign up
  Future<UserCredential> signUp(String email, String password) async {
    try {
      UserCredential userCredential = await _firebasAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  // sign out
  Future signOut() async {
    await _firebasAuth.signOut();
  }
}
