import 'package:firebase_auth/firebase_auth.dart';
import 'package:snap_shot/core/errors/failure.dart';

class FirebaseAuthErorrs {
  static Failure failure(FirebaseAuthException e) {
    switch (e.code) {
      case 'weak-password':
        return Failure(errMessage: 'The password provided is too weak.');
      case 'email-already-in-use':
        return Failure(
          errMessage: ('The account already exists for that email.'),
        );
      default:
        return Failure(errMessage: e.code);
    }
  }
}
