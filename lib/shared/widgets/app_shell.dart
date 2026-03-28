import 'package:flutter/material.dart';
import 'package:snap_shot/features/Home/presentation/view/screens/home_view.dart';
import 'package:snap_shot/shared/widgets/app_bottom_bar.dart';

class AppShell extends StatefulWidget {
  const AppShell({super.key});

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  late int currentIndex;
  final List<Widget> _pages = [
    const HomeView(),
    Container(color: Colors.green, height: 300),
    Container(color: Colors.blue, height: 300),
    Container(color: Colors.yellow, height: 300),
    Container(color: Colors.purple, height: 300),
  ];
  @override
  void initState() {
    super.initState();
    currentIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: AppBottomBar(
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),

      body: SafeArea(
        child: IndexedStack(index: currentIndex, children: _pages),
      ),
    );
  }
}
