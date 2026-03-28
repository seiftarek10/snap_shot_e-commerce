import 'package:flutter/material.dart';
import 'package:snap_shot/shared/widgets/app_bottom_bar.dart';
import 'package:snap_shot/shared/widgets/page_padding.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: AppBottomBar(),

      body: SafeArea(
        child: SingleChildScrollView(
          child: PagePadding(child: Column(children: [])),
        ),
      ),
    );
  }
}

