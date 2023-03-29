// ignore_for_file: camel_case_types, implementation_imports

import 'dart:ui';

import 'package:diskspacerenting/Constants/Constant%20Variables/constants.dart';
import 'package:diskspacerenting/screens/LoginScreen/components/inputTextField.dart';
import 'package:diskspacerenting/screens/LoginScreen/components/loginScreenAnimation.dart';
import 'package:email_validator/email_validator.dart';
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
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const loginScreenAnimation(),
                Text(
                  "Register Now.",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).size.height / 25,
                    // color: kSecondaryColor1,
                    foreground: Paint()..shader = linearGradient1,
                  ),
                ),
                Text(
                  "See your growth and let us help us ease your life!",
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width / 25,
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
                          decoration: BoxDecoration(
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
                          height: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
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
                          height: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
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
                          width: MediaQuery.of(context).size.width * 0.6,
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
                            child: Text(
                              'Register',
                              style: TextStyle(
                                color: kContainerStartColor,
                                // foreground: Paint()..shader = linearGradient2,
                                fontSize:
                                    MediaQuery.of(context).size.width / 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ))
              ],
            ),
          ),
        ),
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
