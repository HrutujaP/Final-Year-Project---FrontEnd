import 'package:flutter/material.dart';

class TopBarItems extends StatelessWidget {
  final Color color;
  const TopBarItems({
    required this.color,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Home',
          style: TextStyle(
            fontSize: 18,
            color: color,
            decoration: TextDecoration.none,
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Text(
          'About',
          style: TextStyle(
            fontSize: 18,
            color: color,
            decoration: TextDecoration.none,
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Text(
          'Contact',
          style: TextStyle(
            fontSize: 18,
            color: color,
            decoration: TextDecoration.none,
          ),
        ),
        const SizedBox(
          width: 20,
        ),
      ],
    );
  }
}
