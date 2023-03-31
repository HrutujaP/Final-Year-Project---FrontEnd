import 'package:diskspacerenting/Constants/Constant%20Variables/constants.dart';
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
        Icon(
          Icons.home,
          size: 40,
          color: kBackgroundEndColor,
        ),

        const SizedBox(
          width: 20,
        ),
        // const Text(
        //   'About',
        //   style: TextStyle(
        //     fontSize: 18,
        //     color: kTextLightColor,
        //     decoration: TextDecoration.none,
        //     fontWeight: FontWeight.bold,
        //   ),
        // ),
        Icon(
          Icons.rotate_right_rounded,
          size: 40,
          color: kBackgroundEndColor,
        ),
        const SizedBox(
          width: 20,
        ),
        // const Text(
        //   'Contact',
        //   style: TextStyle(
        //     fontSize: 18,
        //     color: kTextLightColor,
        //     decoration: TextDecoration.none,
        //     fontWeight: FontWeight.bold,
        //   ),
        // ),
        Icon(
          Icons.contact_page,
          size: 40,
          color: kBackgroundEndColor,
        ),
      ],
    );
  }
}
