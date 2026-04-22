import 'package:snap_shot/core/errors/failure.dart';

sealed class Result<T> {
  const Result();
}

class Success<T> extends Result<T> {
  final T data;

  const Success(this.data);
}

class ErrorCase<T> extends Result<T> {
  final Failure failure;
  ErrorCase(this.failure);
}
