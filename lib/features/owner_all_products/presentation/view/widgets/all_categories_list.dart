import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snap_shot/core/shared_managers/get_products_cubit/get_all_products_cubit.dart';
import 'package:snap_shot/shared/widgets/category_container_item.dart';

class OwnerAllCategoriesList extends StatefulWidget {
  const OwnerAllCategoriesList({super.key});

  @override
  State<OwnerAllCategoriesList> createState() => _OwnerAllCategoriesListState();
}

class _OwnerAllCategoriesListState extends State<OwnerAllCategoriesList> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllProductsCubit, GetAllProductsState>(
      builder: (context, state) {
        final productsCubit = context.read<GetAllProductsCubit>();
        if (state is GetProductsSuccess) {
          return Wrap(
            direction: Axis.horizontal,
            spacing: 10,
            runSpacing: 10,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    currentIndex = 0;
                  });
                  productsCubit.getProductsByCategory(category: 'All');
                },
                child: CategoryItemContainer(
                  isSelected: currentIndex == 0,
                  title: "All",
                ),
              ),

              ...List.generate(productsCubit.categories.length, (index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      currentIndex = index + 1;
                    });
                    productsCubit.getProductsByCategory(
                      category: productsCubit.categories[index],
                    );
                  },
                  child: CategoryItemContainer(
                    isSelected: currentIndex == index + 1,
                    title: productsCubit.categories[index],
                  ),
                );
              }),
            ],
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
