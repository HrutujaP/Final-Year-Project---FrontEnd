import 'package:diskspacerenting/Constants/constants.dart';
import 'package:diskspacerenting/screens/HomeScreen/components/topbaritems.dart';
import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  final Color color;
  const TopBar({
    required this.color,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          'DSR',
          style: TextStyle(
            fontSize: 38,
            color: kSecondaryColor,
            fontWeight: FontWeight.w600,
            decoration: TextDecoration.none,
          ),
        ),
        const Spacer(),
        TopBarItems(
          color: color,
        )
      ],
    );
  }
}
