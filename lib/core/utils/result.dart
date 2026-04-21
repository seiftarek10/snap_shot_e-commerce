sealed class Result<T> {
  const Result();
}

class Success<T> extends Result {
  final T data;

  const Success(this.data);
}

class Error<T> extends Result {
  final String failure;
  Error(this.failure);
}
