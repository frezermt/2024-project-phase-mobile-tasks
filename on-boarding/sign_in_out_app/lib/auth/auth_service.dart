import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<User?> get authStateChanges => _auth.authStateChanges();

  // 1. Email/Password Sign Up
  Future<User?> signUpWithEmail({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await credential.user?.updateDisplayName(name);
      return credential.user;
    } on FirebaseAuthException catch (e) {
      throw AuthException(e.code);
    }
  }

  // 2. Email/Password Sign In
  Future<User?> signInWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user;
    } on FirebaseAuthException catch (e) {
      throw AuthException(e.code);
    }
  }

  // 3. Google Sign In
  Future<User?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      throw AuthException(e.code);
    }
  }

  // 4. Facebook Sign In
  Future<User?> signInWithFacebook() async {
    try {
      final LoginResult result = await FacebookAuth.instance.login();
      if (result.status == LoginStatus.success) {
        final OAuthCredential credential =
            FacebookAuthProvider.credential(result.accessToken!.token);
        UserCredential userCredential =
            await _auth.signInWithCredential(credential);
        return userCredential.user;
      }
      return null;
    } on FirebaseAuthException catch (e) {
      throw AuthException(e.code);
    }
  }

  // 5. Sign Out
  Future<void> signOut() async {
    await _auth.signOut();
    await GoogleSignIn().signOut();
    await FacebookAuth.instance.logOut();
  }
}

class AuthException implements Exception {
  final String code;

  AuthException(this.code);

  String get message {
    switch (code) {
      case 'weak-password':
        return 'Password is too weak';
      case 'email-already-in-use':
        return 'Email already in use';
      case 'invalid-email':
        return 'Invalid email';
      case 'user-disabled':
        return 'User disabled';
      case 'user-not-found':
        return 'User not found';
      case 'wrong-password':
        return 'Wrong password';
      default:
        return 'Authentication failed';
    }
  }
}
