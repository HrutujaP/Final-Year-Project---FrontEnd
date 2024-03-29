import 'package:diskspacerenting/Constants/Constant%20Variables/constants.dart';
import 'package:diskspacerenting/screens/Components/topbaritems.dart';
import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  final Color color;
  const TopBar({
    required this.color,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              kContainerStartColor,
              kContainerMiddleColor,
              kContainerEndColor,
            ],
            begin: Alignment.topLeft,
            end: Alignment.topRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: kSecondaryColor,
                    size: 28,
                  )),
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
          ),
        ),
      ),
    );
  }
}
