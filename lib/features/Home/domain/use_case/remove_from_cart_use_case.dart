import 'package:snap_shot/core/use_case/general_use_case.dart';
import 'package:snap_shot/core/utils/result.dart';
import 'package:snap_shot/features/home/domain/repo/home_repo.dart';

class RemoveFromCartUseCase extends FutureUseCase<void, String> {
  final HomeRepo _homeRepo;

  RemoveFromCartUseCase(this._homeRepo);
  @override
  Future<Result<void>> call(String param) async {
    return await _homeRepo.removeFromCart(id: param);
  }
}
