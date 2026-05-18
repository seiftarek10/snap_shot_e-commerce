import 'package:flutter/material.dart';
import 'package:snap_shot/core/constants/space.dart';
import 'package:snap_shot/core/style/fonts.dart';
import 'package:snap_shot/features/orders/presentation/view/models/order_details_container_item_model.dart';
import 'package:snap_shot/features/orders/presentation/view/widgets/order_details/order_details_conteainer.dart';

class UserInfoContainer extends StatelessWidget {
  const UserInfoContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Text('User Info', style: AppTextStyle.instance.text20Bold),
        AppSpace.instance.v8,
        OrderDetailsContainer(
          containerData: [
            OrderDetailsContainerItemModel(
              label: 'User',
              value: 'Seif Tariq',
              icon: Icons.person_outline_outlined,
            ),
            OrderDetailsContainerItemModel(
              label: 'Mobile',
              value: '01027870171',
              icon: Icons.phone_outlined,
            ),
            OrderDetailsContainerItemModel(
              label: 'Address',
              value: 'Cairo , Ard Elwaa El Tarriq Alabeed Agouza',
              icon: Icons.location_on_outlined,
            ),
          ],
        ),
      ],
    );
  }
}
