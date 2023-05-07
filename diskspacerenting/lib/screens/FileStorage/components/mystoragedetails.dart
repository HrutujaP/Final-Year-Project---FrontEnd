import 'package:diskspacerenting/Constants/Constant%20Variables/constants.dart';
import 'package:diskspacerenting/Constants/Responsive/responsiveWidget.dart';
import 'package:diskspacerenting/models/storage.dart';
import 'package:flutter/material.dart';

class MyStorageDetails extends StatelessWidget {
  Storage storage;
  MyStorageDetails({
    required this.storage,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    String rem = (int.parse(storage.size) - int.parse(storage.used)).toString();

    return SizedBox(
      height: ResponsiveWidget.isSmallScreen(context)
          ? null
          : MediaQuery.of(context).size.height * 0.7,
      width: ResponsiveWidget.isSmallScreen(context)
          ? null
          : MediaQuery.of(context).size.width * 0.35,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  "Balances",
                  style: TextStyle(
                    foreground: Paint()..shader = linearGradient1,
                    fontSize: ResponsiveWidget.isSmallScreen(context)
                        ? MediaQuery.of(context).size.width * 0.08
                        : MediaQuery.of(context).size.width * 0.02,
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.w100,
                  ),
                ),
                const Spacer(),
                Icon(
                  Icons.question_mark_rounded,
                  color: kContainerEndColor,
                  size: ResponsiveWidget.isSmallScreen(context)
                      ? MediaQuery.of(context).size.width * 0.08
                      : MediaQuery.of(context).size.width * 0.025,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0, right: 12.0),
            child: Material(
              elevation: 10,
              borderRadius: BorderRadius.circular(10),
              shadowColor: kContainerStartColor,
              color: Colors.white.withOpacity(0.1),
              child: Container(
                height: ResponsiveWidget.isSmallScreen(context)
                    ? MediaQuery.of(context).size.height * 0.25
                    : MediaQuery.of(context).size.height * 0.6,
                width: ResponsiveWidget.isSmallScreen(context)
                    ? MediaQuery.of(context).size.width
                    : MediaQuery.of(context).size.width * 0.35,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      // Color(0xffFFD4E2), Color(0xffFF8FB3)
                      kContainerStartColor.withOpacity(0.6),
                      kContainerMiddleColor.withOpacity(0.6),
                      kContainerEndColor.withOpacity(0.6),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.account_balance_wallet,
                            color: kTextDarkColor,
                            size: ResponsiveWidget.isSmallScreen(context)
                                ? MediaQuery.of(context).size.width * 0.07
                                : MediaQuery.of(context).size.width * 0.03,
                          ),
                          Text(
                            " Total space rented",
                            style: TextStyle(
                              color: kTextLightColor,
                              fontSize: ResponsiveWidget.isSmallScreen(context)
                                  ? MediaQuery.of(context).size.width * 0.04
                                  : MediaQuery.of(context).size.width * 0.02,
                              decoration: TextDecoration.none,
                              // fontWeight: FontWeight.w200,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            "${storage.size} GB",
                            style: TextStyle(
                              color: kTextLightColor,
                              fontSize: ResponsiveWidget.isSmallScreen(context)
                                  ? MediaQuery.of(context).size.width * 0.04
                                  : MediaQuery.of(context).size.width * 0.02,
                              decoration: TextDecoration.none,
                              // fontWeight: FontWeight.w100,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.phonelink,
                            color: kRedColor,
                            size: ResponsiveWidget.isSmallScreen(context)
                                ? MediaQuery.of(context).size.width * 0.07
                                : MediaQuery.of(context).size.width * 0.03,
                          ),
                          Text(
                            " Space used",
                            style: TextStyle(
                              color: kTextLightColor,
                              fontSize: ResponsiveWidget.isSmallScreen(context)
                                  ? MediaQuery.of(context).size.width * 0.04
                                  : MediaQuery.of(context).size.width * 0.02,
                              decoration: TextDecoration.none,
                              // fontWeight: FontWeight.w100,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            "${storage.used} GB",
                            style: TextStyle(
                              color: kTextLightColor,
                              fontSize: ResponsiveWidget.isSmallScreen(context)
                                  ? MediaQuery.of(context).size.width * 0.04
                                  : MediaQuery.of(context).size.width * 0.02,
                              decoration: TextDecoration.none,
                              // fontWeight: FontWeight.w100,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.computer,
                            color: kContainerMiddleColor,
                            size: ResponsiveWidget.isSmallScreen(context)
                                ? MediaQuery.of(context).size.width * 0.07
                                : MediaQuery.of(context).size.width * 0.03,
                          ),
                          Text(
                            " Space Remaining",
                            style: TextStyle(
                              color: kTextLightColor,
                              fontSize: ResponsiveWidget.isSmallScreen(context)
                                  ? MediaQuery.of(context).size.width * 0.04
                                  : MediaQuery.of(context).size.width * 0.02,
                              decoration: TextDecoration.none,
                              // fontWeight: FontWeight.w100,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            "$rem GB",
                            style: TextStyle(
                              color: kTextLightColor,
                              fontSize: ResponsiveWidget.isSmallScreen(context)
                                  ? MediaQuery.of(context).size.width * 0.04
                                  : MediaQuery.of(context).size.width * 0.02,
                              decoration: TextDecoration.none,
                              // fontWeight: FontWeight.w100,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
