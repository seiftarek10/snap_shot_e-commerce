import 'package:dio/dio.dart';
import 'package:snap_shot/core/errors/faliures.dart';

class AppDioException {
  static ServerFailure handle(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return const ServerFailure(
          'Connection timeout. Please try again later.',
        );
      case DioExceptionType.sendTimeout:
        return const ServerFailure('Send timeout. Please try again later.');
      case DioExceptionType.receiveTimeout:
        return const ServerFailure('Receive timeout. Please try again later.');
      case DioExceptionType.badResponse:
        return const ServerFailure(
          'Bad response from server. Please try again later.',
        );
      case DioExceptionType.cancel:
        return const ServerFailure(
          'Request was cancelled. Please try again later.',
        );
      case DioExceptionType.unknown:
        return const ServerFailure(
          'An unknown error occurred. Please try again later.',
        );
      default:
        return const ServerFailure(
          'An error occurred. Please try again later.',
        );
    }
  }
}
