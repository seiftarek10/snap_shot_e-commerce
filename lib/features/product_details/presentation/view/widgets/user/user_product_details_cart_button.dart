import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snap_shot/core/shared_domain_data/all_products/domain/entity/product_entity.dart';
import 'package:snap_shot/features/cart/presentation/manager/cart_cubit/user_cart_manager_cubit.dart';
import 'package:snap_shot/features/home/presentation/manager/get_products_cubit/get_all_products_cubit.dart';
import 'package:snap_shot/shared/widgets/app_button.dart';

class UserProductDetailsCartButton extends StatelessWidget {
  const UserProductDetailsCartButton({
    super.key,
    required this.product,
    required this.fromHomeScreen,
  });

  final ProductEntity product;
  final bool fromHomeScreen;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCartManegerCubit, UserCartManagerState>(
      builder: (context, state) {
        bool inCart = product.inCart ?? false;

        if (state is AddToCartSuccess && state.id == product.id) {
          inCart = true;
        } else if (state is RemoveFromCartSuccess && state.id == product.id) {
          inCart = false;
        }

        return Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: AppButton(
                key: ValueKey(product.id),

                isLoading: state is UserHomeCartLoading,

                backgroundColor: inCart ? Colors.red[900] : null,
                buttonTitle: '${inCart ? 'Remove From\n' : 'Add To\n'}Cart',
                onPressed: () async {
                  final userHomeCartCubit = context
                      .read<UserCartManegerCubit>();
                  final getAllProductsCubit = fromHomeScreen == true
                      ? context.read<GetAllProductsCubit>()
                      : null;
                  await userHomeCartCubit.toggleCartProdcut(
                    inCart: inCart,
                    product: product,
                  );
                  if (fromHomeScreen) {
                    await getAllProductsCubit!.getAllProducts();
                  }
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
