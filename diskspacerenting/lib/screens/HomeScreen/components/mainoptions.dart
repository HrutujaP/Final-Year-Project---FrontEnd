import 'package:diskspacerenting/Constants/Constant%20Variables/constants.dart';
import 'package:diskspacerenting/screens/PostAdvertisment/postAdvertisment.dart';
import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class MainOptions extends StatelessWidget {
  final IconData icon;
  final String hText;
  final String pText;
  final Color color;
  final String route;

  const MainOptions({
    required this.icon,
    required this.hText,
    required this.pText,
    required this.color,
    required this.route,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: const Size(130, 130), // button width and height
      child: ClipOval(
        child: Material(
          elevation: 10,
          shadowColor: kContainerEndColor,
          color: kContainerMiddleColor, // button color
          child: InkWell(
            splashColor: kContainerStartColor, // splash color
            onTap: () {
              Navigator.pushNamed(context, route);
              // button pressed
            }, // button pressed
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  icon,
                  size: 40,
                  color: kBackgroundEndColor,
                ), // icon
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    hText,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 20,
                      color: kBackgroundEndColor,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Montserrat",
                    ),
                  ),
                ), // text
              ],
            ),
          ),
        ),
      ),
    );
    // Material(
    //   shape: CircleBorder(
    //     side: BorderSide.none,
    //     eccentricity: 1.0,
    //   ),
    //   color: Colors.orange, // button color
    //   child: InkWell(
    //     splashColor: Colors.green, // splash color
    //     onTap: () {}, // button pressed
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: const <Widget>[
    //         Icon(Icons.call), // icon
    //         Text("Call"), // text
    //       ],
    //     ),
    //   ),
    // );
  }
}
