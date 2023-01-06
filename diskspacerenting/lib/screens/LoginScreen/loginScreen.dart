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
                    color: kSecondaryColor1,
                  ),
                ),
                Text(
                  "See your growth and let us help us ease your life!",
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width / 25,
                    color: kSecondaryColor1,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Form(
                    key: _loginformKey,
                    child: Column(
                      children: [
                        inputText(
                          hintText: 'Enter Email Address',
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          onChanged: (val) {
                            _email = val!;
                          },
                          validator: (email) {
                            if (email != null &&
                                EmailValidator.validate(email)) {
                              return null;
                            }
                            return "Invalid email address";
                          },
                          labelheading: 'Email*',
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        inputText(
                          obscureText: !_visiblePassword,
                          hintText: 'Enter Password',
                          textInputAction: TextInputAction.done,
                          keyboardType: TextInputType.visiblePassword,
                          onChanged: (val) {
                            _password = val!;
                          },
                          validator: (password) {
                            if (password == null || password.isEmpty) {
                              return "Empty password";
                            }
                            return null;
                          },
                          suffixIcon: InkWell(
                            onTap: () {
                              setState(() {
                                _visiblePassword = !_visiblePassword;
                              });
                            },
                            child: Icon(
                              _visiblePassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Colors.white,
                            ),
                          ),
                          labelheading: 'Password*',
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 45.5,
                          width: MediaQuery.of(context).size.width,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              elevation: 10,
                              backgroundColor: Colors.white.withOpacity(0.5),
                              shadowColor: Colors.white.withOpacity(0.3),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
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
                                color: Colors.black,
                                fontSize:
                                    MediaQuery.of(context).size.width / 20,
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

