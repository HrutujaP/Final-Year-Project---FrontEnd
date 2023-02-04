import 'package:diskspacerenting/Constants/constants.dart';
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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        elevation: 10,
        shadowColor: kContainerStartColor,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            gradient: LinearGradient(
              colors: [
                kContainerStartColor.withOpacity(0.5),
                kContainerMiddleColor.withOpacity(0.5),
                kContainerEndColor.withOpacity(0.5),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            border: Border.all(
              color: kContainerEndColor,
              width: 3,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, route);
              },
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Icon(
                              icon,
                              color: kContainerMiddleColor,
                              size: MediaQuery.of(context).size.width * 0.09,
                            ),
                          ),
                        ),
                        // const Spacer(),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          hText,
                          style: TextStyle(
                            color: kContainerEndColor,
                            fontSize: MediaQuery.of(context).size.width * 0.05,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: GradientText(
                        pText,
                        style: TextStyle(
                          // color: kTextLightColor,
                          fontSize: MediaQuery.of(context).size.width * 0.045,
                          fontFamily: 'Montserrat',
                          foreground: Paint()..shader = linearGradient,
                          fontWeight: FontWeight.w500,
                        ),
                        gradientType: GradientType.linear,
                        gradientDirection: GradientDirection.ttb,
                        // radius: .4,
                        colors: [
                          kContainerStartColor,
                          kContainerMiddleColor,
                          kContainerEndColor,
                        ],
                        // textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
