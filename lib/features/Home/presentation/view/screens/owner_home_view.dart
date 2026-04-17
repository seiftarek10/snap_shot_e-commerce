import 'package:flutter/material.dart';
import 'package:snap_shot/core/constants/space.dart';
import 'package:snap_shot/features/home/presentation/view/widgets/owner_widgets/owner_container_statistic.dart';
import 'package:snap_shot/shared/widgets/page_padding.dart';
import 'package:snap_shot/shared/widgets/page_title.dart';

class OwnerHomeView extends StatelessWidget {
  const OwnerHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PagePadding(
          child: Column(
            children: [
              AppSpace.instance.topPageSpace,
              const PageTitle(pageTitle: 'Home Screen'),
              AppSpace.instance.v16,

              Row(
                children: [
                  const Expanded(child: OwnerContainerStatistic()),
                  AppSpace.instance.h12,
                  const Expanded(child: OwnerContainerStatistic()),
                ],
              ),
              AppSpace.instance.v12,
              Row(
                children: [
                  const Expanded(child: OwnerContainerStatistic()),
                  AppSpace.instance.h12,

                  const Expanded(child: OwnerContainerStatistic()),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
