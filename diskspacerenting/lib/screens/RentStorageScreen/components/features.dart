import 'dart:ui';

import 'package:diskspacerenting/Constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Features extends StatelessWidget {
  String parameter;
  String value;

  final IconData icon;
  Features({
    required this.parameter,
    required this.value,
    required this.icon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.15,
      width: MediaQuery.of(context).size.width / 4.5,
      child: Column(
        children: [
          ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(
                      MediaQuery.of(context).size.height * 0.08),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Icon(
                    icon,
                    color: kSecondaryColor,
                    size: MediaQuery.of(context).size.height * 0.05,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.001,
          ),
          Column(
            children: [
              Text(parameter,
                  style: GoogleFonts.poppins(
                      color: kPrimaryColor3,
                      fontSize: MediaQuery.of(context).size.height * 0.015,
                      fontWeight: FontWeight.w800)),
              Text(value,
                  style: GoogleFonts.poppins(
                      color: kItemColor2,
                      fontSize: MediaQuery.of(context).size.height * 0.015,
                      fontWeight: FontWeight.w800)),
            ],
          )
        ],
      ),
    );
  }
}
