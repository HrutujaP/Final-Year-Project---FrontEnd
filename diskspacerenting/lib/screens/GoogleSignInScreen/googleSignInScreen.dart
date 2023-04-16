// ignore_for_file: camel_case_types, implementation_imports

import 'package:diskspacerenting/Authentication/googleSignIn.dart';
import 'package:diskspacerenting/Constants/Constant%20Variables/constants.dart';
import 'package:diskspacerenting/Constants/Responsive/responsiveWidget.dart';
import 'package:diskspacerenting/screens/HomeScreen/homescreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:floating_bubbles/floating_bubbles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class registerScreen extends StatelessWidget {
  static const String id = 'registerScreen';
  const registerScreen({super.key});

  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              kBackgroundStartColor,
              kBackgroundStartColor,
              kBackgroundEndColor,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Stack(
          children: [
            Positioned.fill(
              // top: 20,
              child: FloatingBubbles.alwaysRepeating(
                noOfBubbles: 30,
                colorsOfBubbles: [
                  kContainerStartColor.withOpacity(0.5),
                  kContainerMiddleColor.withOpacity(0.5),
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
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // const loginScreenAnimation(),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: GlowText(
                        "Disk Space Renting",
                        // glowColor: kBackgroundEndColor,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          letterSpacing: 5,
                          fontWeight: FontWeight.w800,
                          fontSize: 32,
                          // color: kSecondaryColor1,
                          color: kContainerMiddleColor,
                          // decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "See your growth and let us help us ease your life!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        letterSpacing: 2,
                        fontSize: 22,
                        foreground: Paint()..shader = linearGradient,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Divider(
                      color: kContainerMiddleColor,
                      thickness: 1,
                      indent:
                          ResponsiveWidget.isSmallScreen(context) ? 60 : 180,
                      endIndent:
                          ResponsiveWidget.isSmallScreen(context) ? 60 : 180,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GoogleSignInButton(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

class GoogleSignInButton extends StatefulWidget {
  const GoogleSignInButton({super.key});

  @override
  _GoogleSignInButtonState createState() => _GoogleSignInButtonState();
}

class _GoogleSignInButtonState extends State<GoogleSignInButton> {
  bool _isSigningIn = false;

  void CheckAndCreateAccount(User user, context) async {
    const String apiUrl = "http://10.0.2.2:3000/api/account/create_account";

    final Map<String, String> headers = {
      "Content-type": "application/json; charset=UTF-8",
    };

    final Map<String, dynamic> body = {
      "email": user.email,
      "name": user.displayName,
    };

    print("sending request");
    final http.Response response = await http.post(
      Uri.parse(apiUrl),
      headers: headers,
      body: jsonEncode(body),
    );

    if (response.statusCode == 200) {
      print(response.body);
      setState(() {
        _isSigningIn = false;
      });
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
      );
    } else {
      print(response.body);
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: _isSigningIn
          ? const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(kContainerEndColor),
            )
          : OutlinedButton(
              style: ButtonStyle(
                elevation: MaterialStateProperty.all(5),
                backgroundColor: MaterialStateProperty.all(
                  kContainerMiddleColor.withOpacity(0.9),
                ),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
                shadowColor: MaterialStateProperty.all(kContainerEndColor),
              ),
              onPressed: () async {
                setState(() {
                  _isSigningIn = true;
                });

                User? user = await WebAuthenticationSignIN.signInWithGoogle(
                    context: context);

                if (user != null) {
                  // print(user);
                  // print(user.displayName);
                  // print(user.email);

                  CheckAndCreateAccount(user, context);
                  // Navigator.push(
                  //   savedContext,
                  //   MaterialPageRoute(
                  //     builder: (context) => const HomeScreen(),
                  //   ),
                  // );
                }
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Image(
                      image: AssetImage("assets/images/google_logo.png"),
                      height: 40.0,
                      width: 40.0,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        'Sign in with Google',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black54,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
    );
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
