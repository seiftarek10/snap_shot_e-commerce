import 'package:firebase_auth/firebase_auth.dart';
import 'package:snap_shot/core/errors/failure.dart';

class FirebaseAuthErrors {
  static Failure handleException(Object e) {
    if (e is FirebaseAuthException) {
      switch (e.code) {
        case 'weak-password':
          return Failure(errMessage: 'The password provided is too weak.');
        case 'email-already-in-use':
          return Failure(errMessage: 'This email is already registered.');
        case 'user-not-found':
          return Failure(errMessage: 'No user found for that email.');
        case 'wrong-password':
          return Failure(errMessage: 'Wrong password provided.');
        case 'network-request-failed':
          return Failure(errMessage: 'Please check your internet connection.');
        default:
          return Failure(errMessage: 'Authentication Error: ${e.code}');
      }
    } else if (e is Exception) {
      return Failure(errMessage: 'An unexpected error occurred. Please try again.');
    } else {
      return Failure(errMessage: 'Something went wrong.');
    }
  }
}