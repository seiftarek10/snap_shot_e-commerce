import 'package:snap_shot/core/use_case/general_use_case.dart';
import 'package:snap_shot/core/utils/result.dart';
import 'package:snap_shot/features/cart/domain/repos/cart_repo.dart';

class RemoveFromCartUseCase extends FutureUseCase<void, String> {
  final CartRepo _cartRepo;

  RemoveFromCartUseCase(this._cartRepo);
  @override
  Future<Result<void>> call(String param) async {
    return await _cartRepo.removeFromCart(id: param);
  }
}
