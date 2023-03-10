import 'package:flutter/material.dart';

class BottomDotBar extends StatelessWidget {
  final int currentIndex;
  final int dotCount;
  final Color dotColor;
  final Color activeDotColor;

  const BottomDotBar({
    super.key,
    required this.currentIndex,
    required this.dotCount,
    this.dotColor = Colors.grey,
    this.activeDotColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(dotCount, (index) {
        return Container(
          width: 8.0,
          height: 8.0,
          margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 2.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: index == currentIndex ? activeDotColor : dotColor,
          ),
        );
      }),
    );
  }
}
