// ignore_for_file: camel_case_types

import 'package:diskspacerenting/Constants/constants.dart';
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
  final _formKey = GlobalKey<FormState>();
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
                    key: _formKey,
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
                              if (!_formKey.currentState!.validate()) {
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

class inputText extends StatelessWidget {
  final Function(String?) onChanged;
  final String? Function(String?)? validator;
  final String hintText;
  final String labelheading;
  final bool obscureText;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final TextInputAction? textInputAction;
  const inputText({
    required this.onChanged,
    required this.hintText,
    required this.labelheading,
    this.validator,
    this.obscureText = false,
    this.keyboardType,
    this.suffixIcon,
    this.textInputAction,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            labelheading,
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.width / 25,
              color: kSecondaryColor1,
            ),
          ),
        ),
        TextFormField(
          cursorColor: Colors.grey,
          obscureText: obscureText,
          validator: validator,
          onChanged: onChanged,
          keyboardType: keyboardType ?? TextInputType.text,
          textInputAction: textInputAction,
          decoration: InputDecoration(
            suffixIcon: suffixIcon,
            contentPadding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
            hintText: hintText,
            fillColor: Colors.black,
            filled: true,
            errorStyle: const TextStyle(height: 0, color: Colors.transparent),
            hintStyle: TextStyle(
              fontSize: MediaQuery.of(context).size.width / 25,
              color: Colors.grey,
              fontWeight: FontWeight.w300,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide: const BorderSide(color: Colors.white, width: .5),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide: const BorderSide(color: Colors.white, width: .5),
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
                borderSide: const BorderSide(color: Colors.white, width: .5)),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide: const BorderSide(color: kRedColor, width: .5),
            ),
          ),
          style: const TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
