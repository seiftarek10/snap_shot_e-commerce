import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snap_shot/features/account/presentation/view/widgets/address_details/address_card_item.dart';

class AllUserAddresses extends StatefulWidget {
  const AllUserAddresses({super.key});

  @override
  State<AllUserAddresses> createState() => _AllUserAddressesState();
}

class _AllUserAddressesState extends State<AllUserAddresses> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(2, (index) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          child: AddressCardItem(
            onTap: () {
              setState(() {
                currentIndex = index;
              });
            },
            isSelected: currentIndex == index,
          ),
        );
      }),
    );
  }
}
