// ignore_for_file: camel_case_types, implementation_imports

import 'dart:ui';

import 'package:diskspacerenting/Constants/Constant%20Variables/constants.dart';
import 'package:diskspacerenting/Constants/Responsive/responsiveWidget.dart';
import 'package:diskspacerenting/screens/LoginScreen/components/inputTextField.dart';
import 'package:diskspacerenting/screens/LoginScreen/components/loginScreenAnimation.dart';
import 'package:email_validator/email_validator.dart';
import 'package:floating_bubbles/floating_bubbles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class registerScreen extends StatefulWidget {
  static const String id = 'registerScreen';
  const registerScreen({super.key});

  @override
  State<registerScreen> createState() => _registerScreenState();
}

class _registerScreenState extends State<registerScreen> {
  final _registerformKey = GlobalKey<FormState>();
  bool _visiblePassword = false;
  String _email = '';
  String _password = '';
  String _fullName = '';
  String? _error;
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned.fill(
            // top: 20,
            child: FloatingBubbles.alwaysRepeating(
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
              speed: BubbleSpeed.slow, // normal is the default
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
            child: Row(
              children: [
                 ResponsiveWidget.isSmallScreen(context) ? SizedBox() : Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // const loginScreenAnimation(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Register Now.",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 26,
                          // color: kSecondaryColor1,
                          foreground: Paint()..shader = linearGradient1,
                        ),
                      ),
                    ),
                    Text(
                      "See your growth and let us help us ease your life!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22,
                        foreground: Paint()..shader = linearGradient,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Form(
                        key: _registerformKey,
                        child: Column(
                          children: [
                            Container(
                              width: ResponsiveWidget.isSmallScreen(context)
                                  ? MediaQuery.of(context).size.width
                                  : MediaQuery.of(context).size.width / 2.5,
                              decoration: BoxDecoration(
                                borderRadius: new BorderRadius.circular(4.0),
                                gradient: LinearGradient(
                                  colors: [
                                    kContainerStartColor.withOpacity(0.4),
                                    kContainerMiddleColor.withOpacity(0.4),
                                    kContainerEndColor.withOpacity(0.4),
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ),
                              ),
                              child: TextFormField(
                                  style: TextStyle(
                                    color: kTextLightColor,
                                  ),
                                  cursorColor: kContainerStartColor,
                                  keyboardType: TextInputType.phone,
                                  decoration: InputDecoration(
                                    fillColor: kTextLightColor,
                                    focusColor: kTextLightColor,
                                    labelText: 'Name',
                                    labelStyle: TextStyle(
                                      color: kContainerMiddleColor,
                                    ),
                                    hintText: 'Enter your Name',
                                    hintStyle: TextStyle(
                                      color: kContainerEndColor,
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: kContainerEndColor)),
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide()),
                                    disabledBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: kContainerEndColor)),
                                  )),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              width: ResponsiveWidget.isSmallScreen(context)
                                  ? MediaQuery.of(context).size.width
                                  : MediaQuery.of(context).size.width / 2.5,
                              decoration: BoxDecoration(
                                borderRadius: new BorderRadius.circular(4.0),
                                gradient: LinearGradient(
                                  colors: [
                                    kContainerStartColor.withOpacity(0.4),
                                    kContainerMiddleColor.withOpacity(0.4),
                                    kContainerEndColor.withOpacity(0.4),
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ),
                              ),
                              child: TextFormField(
                                  style: const TextStyle(
                                    color: kTextLightColor,
                                  ),
                                  cursorColor: kContainerStartColor,
                                  keyboardType: TextInputType.phone,
                                  decoration: const InputDecoration(
                                    fillColor: kTextLightColor,
                                    focusColor: kTextLightColor,
                                    labelText: 'Email Address',
                                    labelStyle: TextStyle(
                                      color: kContainerMiddleColor,
                                    ),
                                    hintText: 'Enter your email address',
                                    hintStyle: TextStyle(
                                      color: kContainerEndColor,
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: kContainerEndColor)),
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide()),
                                    disabledBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: kContainerEndColor)),
                                  )),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              width: ResponsiveWidget.isSmallScreen(context)
                                  ? MediaQuery.of(context).size.width
                                  : MediaQuery.of(context).size.width / 2.5,
                              decoration: BoxDecoration(
                                borderRadius: new BorderRadius.circular(4.0),
                                gradient: LinearGradient(
                                  colors: [
                                    kContainerStartColor.withOpacity(0.4),
                                    kContainerMiddleColor.withOpacity(0.4),
                                    kContainerEndColor.withOpacity(0.4),
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ),
                              ),
                              child: TextFormField(
                                  style: const TextStyle(
                                    color: kTextLightColor,
                                  ),
                                  cursorColor: kContainerStartColor,
                                  keyboardType: TextInputType.phone,
                                  decoration: const InputDecoration(
                                    fillColor: kTextLightColor,
                                    focusColor: kTextLightColor,
                                    labelText: 'Password',
                                    labelStyle: TextStyle(
                                      color: kContainerMiddleColor,
                                    ),
                                    hintText: 'Enter your password',
                                    hintStyle: TextStyle(
                                      color: kContainerEndColor,
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: kContainerEndColor)),
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide()),
                                    disabledBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: kContainerEndColor)),
                                  )),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              height: 45.5,
                              width: ResponsiveWidget.isSmallScreen(context)
                                  ? MediaQuery.of(context).size.width / 2
                                  : MediaQuery.of(context).size.width / 4.5,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  elevation: 10,
                                  backgroundColor:
                                      kContainerMiddleColor.withOpacity(0.6),
                                  shadowColor: kContainerStartColor,
                                  // shape: RoundedRectangleBorder(
                                  //   borderRadius: BorderRadius.circular(25),
                                  // ),
                                ),
                                onPressed: () async {
                                  if (!_registerformKey.currentState!.validate()) {
                                    setState(() {
                                      _error =
                                          'Please provide a valid email/password combination';
                                    });
                                  } else {
                                    /// Add business logic to authenticate user.
                                    /// User _email and _password
                                    setState(() {
                                      _error = '';
                                    });
                                  }
                                },
                                child: const Text(
                                  'Register',
                                  style: TextStyle(
                                    color: kBackgroundEndColor,
                                    // foreground: Paint()..shader = linearGradient2,
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ))
                  ],
                ),
               ResponsiveWidget.isSmallScreen(context) ? SizedBox() : Spacer(),],
            ),
          ),
        ],
      ),
    ));
  }
}

 //   suffixIcon: InkWell(
                        //     onTap: () {
                        //       setState(() {
                        //         _visiblePassword = !_visiblePassword;
                        //       });
                        //     },
                        //     child: Icon(
                        //       _visiblePassword
                        //           ? Icons.visibility_off
                        //           : Icons.visibility,
                        //       color: Colors.white,
                        //     ),
                        //   ),
