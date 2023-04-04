import 'package:diskspacerenting/Constants/Constant%20Variables/constants.dart';
import 'package:diskspacerenting/Constants/Responsive/responsiveWidget.dart';
import 'package:floating_bubbles/floating_bubbles.dart';
import 'package:flutter/material.dart';

class IndividualFiles extends StatelessWidget {
  const IndividualFiles({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ResponsiveWidget.isSmallScreen(context)
          ? null
          : MediaQuery.of(context).size.height * 0.7,
      width: ResponsiveWidget.isSmallScreen(context)
          ? null
          : MediaQuery.of(context).size.width * 0.65,
      child: Column(
        children: [
          Text(
            "Items",
            style: TextStyle(
              foreground: Paint()..shader = linearGradient1,
              fontSize: ResponsiveWidget.isSmallScreen(context)
                  ? MediaQuery.of(context).size.width * 0.08
                  : MediaQuery.of(context).size.width * 0.017,
              decoration: TextDecoration.none,
              // fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.left,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: ResponsiveWidget.isSmallScreen(context)
                  ? MediaQuery.of(context).size.height / 2.8
                  : MediaQuery.of(context).size.height * 0.6,
              width: ResponsiveWidget.isSmallScreen(context)
                  ? MediaQuery.of(context).size.width
                  : MediaQuery.of(context).size.width * 0.6,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.white.withOpacity(0.2),
                      Colors.white.withOpacity(0.2),
                      // kContainerEndColor.withOpacity(0.2),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: kBackgroundEndColor,
                    width: 1,
                  ),
                ),
                // color: kPrimaryColor2.withOpacity(0.8),
                child: GridView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: 9,
                  physics: const BouncingScrollPhysics(),
                  primary: false,
                  padding: const EdgeInsets.all(8),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: (2.2 / 2.0002),
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    crossAxisCount: ResponsiveWidget.isSmallScreen(context)
                        ? 2
                        : ResponsiveWidget.isMediumScreen(context)
                            ? 3
                            : 4,
                  ),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Material(
                        borderRadius: BorderRadius.circular(10),
                        elevation: 20,
                        shadowColor: kTextLightColor,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: kContainerEndColor,
                              width: 1,
                            ),
                            // color: kSecondaryColor3,
                            color: kContainerEndColor,
                            // color: kColor1.withOpacity(0.9),
                          ),
                          child: Center(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Center(
                                    child: Stack(
                                      children: [
                                        Positioned.fill(
                                          top: 20,
                                          child: FloatingBubbles(
                                            noOfBubbles: 20,
                                            colorsOfBubbles: const [
                                              kContainerStartColor,
                                              kContainerMiddleColor,
                                              // kContainerEndColor,
                                            ],

                                            sizeFactor: 0.2,
                                            duration: 120, // 120 seconds.
                                            opacity: 100,
                                            paintingStyle: PaintingStyle.fill,
                                            strokeWidth: 8,
                                            shape: BubbleShape
                                                .circle, // circle is the default. No need to explicitly mention if its a circle.
                                            speed: BubbleSpeed
                                                .normal, // normal is the default
                                          ),
                                        ),
                                        Column(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                "File name",
                                                style: TextStyle(
                                                  fontSize: ResponsiveWidget
                                                          .isSmallScreen(
                                                              context)
                                                      ? MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          0.04
                                                      : MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          0.015,
                                                  fontWeight: FontWeight.bold,
                                                  color: kTextDarkColor,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Icon(
                                                Icons.file_open_rounded,
                                                color: kTextDarkColor,
                                                size: ResponsiveWidget
                                                        .isSmallScreen(context)
                                                    ? MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        0.1
                                                    : MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        0.05,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
