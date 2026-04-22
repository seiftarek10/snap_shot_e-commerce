import 'package:snap_shot/core/utils/result.dart';

abstract class UseCase<T, Param> {
  Future<Result<T>> call(Param param);
}
