import 'package:firebase_core/firebase_core.dart';
import 'package:snap_shot/core/errors/failure.dart';

class FirestoreError {
  static Failure handleFireStoreError(FirebaseException e) {
    switch (e.code) {
      case 'permission-denied':
        return const Failure(
          'Access denied. You do not have the required permissions.',
        );
      case 'unauthenticated':
        return const Failure('Authentication required. Please log in again.');
      case 'not-found':
        return const Failure(
          'The requested document or collection does not exist.',
        );
      case 'already-exists':
        return const Failure(
          'Conflict: The document you are trying to create already exists.',
        );
      case 'failed-precondition':
        return const Failure(
          'Operation failed. This usually requires a missing index or specific state.',
        );
      case 'unavailable':
        return const Failure(
          'The database is currently offline or your internet is disconnected.',
        );
      case 'deadline-exceeded':
        return const Failure(
          'The database took too long to respond (Timeout).',
        );
      case 'resource-exhausted':
        return const Failure(
          'Quota exceeded. Too many requests or storage limit reached.',
        );
      case 'cancelled':
        return const Failure('The database operation was cancelled.');
      case 'invalid-argument':
        return const Failure(
          'The data format or query parameters are invalid.',
        );
      case 'out-of-range':
        return const Failure('The operation went out of the allowed range.');
      case 'aborted':
        return const Failure(
          'Transaction aborted. Please try again (Concurrency issue).',
        );
      case 'internal':
        return const Failure(
          'Database internal error. Please try again later.',
        );
      case 'unimplemented':
        return const Failure(
          'This feature is not yet supported by the database.',
        );
      case 'data-loss':
        return const Failure(
          'Critical error: Data loss or corruption detected.',
        );
      case 'unknown':
        return const Failure('An unknown database error occurred.');
      default:
        return Failure('Unexpected error [${e.code}]: ${e.message}');
    }
  }


}
