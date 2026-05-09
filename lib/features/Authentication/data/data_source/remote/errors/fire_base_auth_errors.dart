import 'package:firebase_auth/firebase_auth.dart';
import 'package:snap_shot/core/errors/faliures.dart';

class FirebaseAuthErrors {
  static AuthFailure handleException(Object e) {
    if (e is FirebaseAuthException) {
      switch (e.code) {
        case 'weak-password':
          return const AuthFailure('The password provided is too weak.');
        case 'email-already-in-use':
          return const AuthFailure('This email is already registered.');
        case 'user-not-found':
          return const AuthFailure('No user found for that email.');
        case 'wrong-password':
          return const AuthFailure('Wrong password provided.');
        case 'network-request-failed':
          return const AuthFailure('Please check your internet connection.');
        default:
          return AuthFailure('Authentication Error: ${e.code}');
      }
    } else if (e is Exception) {
      return const AuthFailure(
        'An unexpected error occurred. Please try again.',
      );
    } else {
      return const AuthFailure('Something went wrong.');
    }
  }
}
