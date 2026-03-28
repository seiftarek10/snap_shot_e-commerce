import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snap_shot/core/constants/assets.dart';
import 'package:snap_shot/features/authentication/data/Models/send_code_options_data_model.dart';
import 'package:snap_shot/features/authentication/presentation/view/widgets/forget_password/send_code_method.dart';

class AllSendCodeOptions extends StatefulWidget {
  const AllSendCodeOptions({super.key});

  @override
  State<AllSendCodeOptions> createState() => _AllSendCodeOptionsState();
}

class _AllSendCodeOptionsState extends State<AllSendCodeOptions> {
  late int currentIndex;

  @override
  void initState() {
    super.initState();
    currentIndex = -1;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(2, (index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              currentIndex = index;
            });
          },
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 8.h),
            child: SendCodeMethod(
              isSelected: currentIndex == index,
              sendCodeMethodModel: SendCodeMethodModel(
                method: index == 0 ? "Email" : "Phone",
                info: index == 0 ? "******t470@gmail.com" : "*******1234",
                icon: index == 0 ? Assets.imagesSvgMail : Assets.imagesSvgPhone,
              ),
            ),
          ),
        );
      }),
    );
  }
}
