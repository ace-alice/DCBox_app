import 'package:flutter/material.dart';

class PageIndicatorComponent extends StatelessWidget {
  final int currentPage;
  final int pageCount;

  const PageIndicatorComponent(
      {super.key, required this.currentPage, required this.pageCount});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List<Widget>.generate(pageCount, (int index) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 5.0),
          height: 5.0,
          width: 20.0,
          decoration: BoxDecoration(
            color:
                currentPage == index ? const Color(0xFF118FFF) : Colors.white,
            borderRadius: BorderRadius.circular(5.0),
          ),
        );
      }),
    );
  }
}
