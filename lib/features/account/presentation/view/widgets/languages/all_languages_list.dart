import 'package:flutter/material.dart';
import 'package:snap_shot/features/account/presentation/view/widgets/languages/languages_item.dart';

class AllLanguagesList extends StatefulWidget {
  const AllLanguagesList({super.key});

  @override
  State<AllLanguagesList> createState() => _AllLanguagesListState();
}

class _AllLanguagesListState extends State<AllLanguagesList> {
  List<String> languages = ['English', 'Arabic'];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: languages.length,
      itemBuilder: (context, index) {
        return InkWell(
          overlayColor: const WidgetStatePropertyAll(Colors.transparent),
          onTap: () {
            setState(() {
              currentIndex = index;
            });
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: LanguagesItem(
              isSelected: currentIndex == index,
              language: languages[index],
            ),
          ),
        );
      },
    );
  }
}
