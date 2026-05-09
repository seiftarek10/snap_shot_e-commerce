import 'package:snap_shot/core/utils/result.dart';

abstract class UseCase<T, Param> {
  const UseCase();
  Future<Result<T>> call(Param param);
}
