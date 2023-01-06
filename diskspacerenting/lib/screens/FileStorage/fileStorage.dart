// ignore_for_file: non_constant_identifier_names, prefer_typing_uninitialized_variables

import 'dart:math';

import 'package:diskspacerenting/Constants/constants.dart';
import 'package:diskspacerenting/screens/HomeScreen/components/topbar.dart';
import 'package:diskspacerenting/screens/HomeScreen/components/topbaritems.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/material/app.dart';
import 'package:flutter_glow/flutter_glow.dart';

class FileStoarage extends StatefulWidget {
  const FileStoarage({super.key});
  static const String id = 'FileStoarage_screen';

  @override
  State<FileStoarage> createState() => _FileStoarageState();
}

class _FileStoarageState extends State<FileStoarage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          color: kPrimaryColor1,
          gradient: LinearGradient(
            colors: [
              kPrimaryColor1,
              kPrimaryColor,
              kPrimaryColor1,
              kPrimaryColor,
              // kPrimaryColor1,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: Row(
                //     children: [
                //       Icon(
                //         Icons.account_circle,
                //         color: kSecondaryColor1,
                //         size: MediaQuery.of(context).size.width * 0.1,
                //       ),
                //       Spacer(),
                //       Icon(
                //         Icons.notifications_rounded,
                //         color: kSecondaryColor1,
                //         size: MediaQuery.of(context).size.width * 0.1,
                //       )
                //     ],
                //   ),
                // ),
                const Padding(
                  padding: EdgeInsets.all(3.0),
                  child: TopBar(color: kSecondaryColor),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 8, 0, 0),
                  child: Text("Explore the",
                      style: TextStyle(
                        color: kSecondaryColor1,
                        fontSize: MediaQuery.of(context).size.width * 0.045,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.w100,
                      ),
                      textAlign: TextAlign.left),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 8, 0, 0),
                  child: Text("Storage",
                      style: TextStyle(
                          color: kSecondaryColor1,
                          fontSize: MediaQuery.of(context).size.width * 0.1,
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                        "Balances",
                        style: TextStyle(
                          color: kSecondaryColor1,
                          fontSize: MediaQuery.of(context).size.width * 0.045,
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                      Spacer(),
                      Icon(
                        Icons.question_mark_rounded,
                        color: kSecondaryColor1,
                        size: MediaQuery.of(context).size.width * 0.08,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                  child: Material(
                    elevation: 10,
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white.withOpacity(0.1),
                    child: Container(
                      // height: MediaQuery.of(context).size.height * 0.25,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10),
                      ),

                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.account_balance_wallet,
                                  color: kSecondaryColor3,
                                  size:
                                      MediaQuery.of(context).size.width * 0.07,
                                ),
                                Text(
                                  " Total space rented",
                                  style: TextStyle(
                                    color: kSecondaryColor1,
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.04,
                                    decoration: TextDecoration.none,
                                    // fontWeight: FontWeight.w200,
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  "32 GB",
                                  style: TextStyle(
                                    color: kSecondaryColor1,
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.04,
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
                                  size:
                                      MediaQuery.of(context).size.width * 0.07,
                                ),
                                Text(
                                  " Space used",
                                  style: TextStyle(
                                    color: kSecondaryColor1,
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.04,
                                    decoration: TextDecoration.none,
                                    // fontWeight: FontWeight.w100,
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  "8 GB",
                                  style: TextStyle(
                                    color: kSecondaryColor1,
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.04,
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
                                  color: kSecondaryColor2,
                                  size:
                                      MediaQuery.of(context).size.width * 0.07,
                                ),
                                Text(
                                  " Space Remaining",
                                  style: TextStyle(
                                    color: kSecondaryColor1,
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.04,
                                    decoration: TextDecoration.none,
                                    // fontWeight: FontWeight.w100,
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  "16 GB",
                                  style: TextStyle(
                                    color: kSecondaryColor1,
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.04,
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
                Padding(
                  padding: const EdgeInsets.fromLTRB(12, 25, 0, 0),
                  child: Text(
                    "Items",
                    style: TextStyle(
                      color: kSecondaryColor1,
                      fontSize: MediaQuery.of(context).size.width * 0.07,
                      decoration: TextDecoration.none,
                      // fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: MediaQuery.of(context).size.height / 2.8,
                child: Container(
                  color: Colors.white.withOpacity(0.1),
                  child: GridView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: 9,
                    physics: const BouncingScrollPhysics(),
                    primary: false,
                    padding: const EdgeInsets.all(8),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: (2.2 / 2.0002),
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Material(
                          borderRadius: BorderRadius.circular(10),
                          elevation: 20,
                          shadowColor: kSecondaryColor1,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: kPrimaryColor.withOpacity(0.4),
                                width: 1,
                              ),
                              // color: kSecondaryColor3,
                              color: Colors.black,
                              // color: kColor1.withOpacity(0.9),
                            ),
                            child: Center(
                              child: Stack(
                                children: [
                                  CustomPaint(
                                    size: Size(
                                      MediaQuery.of(context).size.width * 0.41,
                                      MediaQuery.of(context).size.width * 0.4,
                                    ),
                                    painter: CurvedPainter1(
                                      // Color: kItemColor,
                                      Color: kColor2,
                                    ),
                                  ),
                                  CustomPaint(
                                    size: Size(
                                      MediaQuery.of(context).size.width * 0.39,
                                      MediaQuery.of(context).size.width * 0.5,
                                    ),
                                    painter: CurvedPainter1(
                                      // Color: kSecondaryColor2,
                                      Color: kPrimaryColor,
                                      // Color: kColor2.withOpacity(0.3),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: GlowText(
                                              "File name",
                                              style: TextStyle(
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.04,
                                                fontWeight: FontWeight.bold,
                                                color: kSecondaryColor1,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: GlowIcon(
                                              Icons.file_open_rounded,
                                              color: kSecondaryColor1,
                                              size: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.1,
                                            ),
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
      ),
    );
  }
}

double _generateDouble2(double minValue, double maxValue, int precision) {
  final random = Random();
  final doubleRandom = minValue + (maxValue - minValue) * random.nextDouble();
  return double.parse(doubleRandom.toStringAsFixed(precision));
}

class CurvedPainter1 extends CustomPainter {
  final Color;

  CurvedPainter1({required this.Color});
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Color
      ..strokeWidth = 15;

    const double min = 0;
    const double max = 0.5;
    const double min1 = 0.5;
    const double max1 = 1;

    final value1 = _generateDouble2(min, max, 4);
    final value2 = _generateDouble2(min, max, 4);
    final value3 = _generateDouble2(min1, max1, 4);
    final value4 = _generateDouble2(min1, max1, 4);
    final value5 = _generateDouble2(min, max, 4);
    final value6 = _generateDouble2(min, max, 4);
    final value7 = _generateDouble2(min, max, 4);
    final value8 = _generateDouble2(min1, max1, 4);
    final value9 = _generateDouble2(min1, max1, 4);
    var path = Path();

    path.moveTo(0, size.height * value1);
    path.quadraticBezierTo(size.width * value2, size.height * value3,
        size.width * value4, size.height * value5);
    path.quadraticBezierTo(size.width * value6, size.height * value7,
        size.width * value8, size.height * value9);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
