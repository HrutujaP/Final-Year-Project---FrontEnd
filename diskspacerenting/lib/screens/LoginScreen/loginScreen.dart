// ignore_for_file: camel_case_types

import 'package:diskspacerenting/Constants/constants.dart';
import 'package:diskspacerenting/screens/LoginScreen/components/inputTextField.dart';
import 'package:diskspacerenting/screens/LoginScreen/components/loginScreenAnimation.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_glow/flutter_glow.dart';

class loginScreen extends StatefulWidget {
  static const String id = 'loginScreen';
  const loginScreen({super.key});

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  @override
  final _loginformKey = GlobalKey<FormState>();
  bool _visiblePassword = false;
  String _email = '';
  String _password = '';
  String? _error;
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const loginScreenAnimation(),
                Text(
                  "Login",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).size.height / 20,
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
                    key: _loginformKey,
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
                              if (!_loginformKey.currentState!.validate()) {
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
                              'Log In',
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
