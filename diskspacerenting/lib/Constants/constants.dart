import 'package:flutter/material.dart';

const Color kSecondaryColor1 = Colors.white;
const Color kItemColor = Color.fromARGB(255, 120, 216, 235);
const Color kItemColor2 = Color.fromARGB(255, 234, 183, 235);
const Color kPurpleColor = Color.fromARGB(255, 141, 8, 165);
const Color kColor1 = Color.fromARGB(255, 204, 193, 232);
const Color kColor2 = Color.fromARGB(255, 60, 16, 89);
const Color kPrimaryColor = Color(0xFFF5F8FF);
const Color kPrimaryColor2 = Color.fromARGB(255, 221, 228, 245);
const Color kPrimaryColor3 = Color(0xFFC6F6C6);
const Color kPrimaryColor4 = Color(0xFFF9CEDF);
const Color kPrimaryColor5 = Color(0xFF8CBBF1);
const Color kPrimaryColor6 = Color(0xFFB0E0E6);
const Color kSecondaryColor = Color(0xFFFFFFFF);
const Color kSecondaryColor2 = Color(0xFF8E8E93);
const Color kSecondaryColor3 = Color(0xFFC0C0C0);
const Color kContrastColor = Color(0xFF000000);

////////////////////////////////////////////////////////////////////////////////////////////////////

const Color kTextColor = Color.fromARGB(255, 215, 232, 24);
const Color kDatePickerColor = Color.fromARGB(255, 172, 246, 124);
const Color kContainerStartColor = Color.fromARGB(255, 106, 210, 37);
const Color kContainerMiddleColor = Color.fromARGB(255, 68, 213, 94);
const Color kContainerEndColor = Color.fromARGB(255, 20, 158, 114);
const Color kBackgroundStartColor = Color.fromARGB(255, 61, 67, 78);
const Color kBackgroundEndColor = Color(0xFF1F2123);

const Color kTextLightColor = Color(0xFFFFFFFF);
const Color kTextDarkColor = Colors.black;
const Color kRedColor = Colors.red;

final Shader linearGradient = const LinearGradient(
  colors: <Color>[
    kContainerStartColor,
    kContainerMiddleColor,
    kContainerEndColor,
  ],
).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

final Shader linearGradient1 = const LinearGradient(
  colors: <Color>[
    kContainerStartColor,
    kContainerEndColor,
  ],
).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

final Shader linearGradient2 = LinearGradient(
  colors: <Color>[
    kContainerStartColor.withOpacity(0.8),
    kContainerMiddleColor.withOpacity(0.3),
    kContainerEndColor.withOpacity(0.3),
    kContainerEndColor.withOpacity(0.3),
  ],
).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));
