import 'package:diskspacerenting/Constants/Constant%20Variables/constants.dart';
import 'package:diskspacerenting/Constants/Responsive/responsiveWidget.dart';
import 'package:diskspacerenting/screens/Components/topbar.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TopBar(color: kSecondaryColor),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.03,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 8, 0, 0),
          child: Text("Explore the",
              style: TextStyle(
                // color: kTextLightColor,
                foreground: Paint()..shader = linearGradient,
                fontSize: ResponsiveWidget.isSmallScreen(context)
                    ? MediaQuery.of(context).size.width * 0.045
                    : MediaQuery.of(context).size.width * 0.02,
                decoration: TextDecoration.none,
                fontWeight: FontWeight.w100,
              ),
              textAlign: TextAlign.left),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 8, 0, 0),
          child: Text("Storage.",
              style: TextStyle(
                  foreground: Paint()..shader = linearGradient,
                  fontSize: ResponsiveWidget.isSmallScreen(context)
                      ? MediaQuery.of(context).size.width * 0.08
                      : MediaQuery.of(context).size.width * 0.03,
                  decoration: TextDecoration.none,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.left),
        ),
      ],
    );
  }
}
