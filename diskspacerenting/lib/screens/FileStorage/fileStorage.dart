// ignore_for_file: non_constant_identifier_names, prefer_typing_uninitialized_variables

import 'dart:math';

import 'package:diskspacerenting/Constants/Constant%20Variables/constants.dart';
import 'package:diskspacerenting/Constants/Responsive/responsiveWidget.dart';
import 'package:diskspacerenting/screens/FileStorage/components/header.dart';
import 'package:diskspacerenting/screens/FileStorage/components/individualfiles.dart';
import 'package:diskspacerenting/screens/FileStorage/components/mystoragedetails.dart';
import 'package:flutter/material.dart';

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
          // color: kPrimaryColor1,
          gradient: LinearGradient(
            colors: [
              kBackgroundStartColor,
              kBackgroundEndColor,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Header(),
            const Spacer(),
            ResponsiveWidget.isSmallScreen(context)
                ? Column(
                    children: const [
                      MyStorageDetails(),
                      IndividualFiles(),
                    ],
                  )
                : Row(
                
                    children: const [
                      MyStorageDetails(),
                      IndividualFiles(),
                    ],
                  ),
            const Spacer()
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
