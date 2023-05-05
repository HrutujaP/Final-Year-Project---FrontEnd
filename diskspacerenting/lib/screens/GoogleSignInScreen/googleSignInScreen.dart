// ignore_for_file: camel_case_types, implementation_imports

import 'dart:io';

import 'package:diskspacerenting/Authentication/googleSignIn.dart';
import 'package:diskspacerenting/Constants/Constant%20Variables/constants.dart';
import 'package:diskspacerenting/Constants/Responsive/responsiveWidget.dart';
import 'package:diskspacerenting/Functions/functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:floating_bubbles/floating_bubbles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:googleapis_auth/auth_io.dart';

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
                    const googleSignInButton(),
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

class googleSignInButton extends StatefulWidget {
  const googleSignInButton({super.key});

  @override
  _googleSignInButtonState createState() => _googleSignInButtonState();
}

class _googleSignInButtonState extends State<googleSignInButton> {
  bool _isSigningIn = false;

  void _lauchAuthInBrowser(String url) async {
    launchUrl(Uri.parse(url));
  }

  void _loginWindowsDesktop() {
    var id = ClientId(
      "1052056528612-46dir4v3ur0pi4o8c5ssjsvdetqdjatp.apps.googleusercontent.com",
      "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",
    );
    var scopes = [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
      'https://www.googleapis.com/auth/userinfo.profile',
      'https://www.googleapis.com/auth/userinfo.email'
    ];

    var client = Client();
    obtainAccessCredentialsViaUserConsent(
            id, scopes, client, (url) => _lauchAuthInBrowser(url))
        .then((AccessCredentials credentials) {
      // read name an email as User
      var authClient = authenticatedClient(client, credentials);
      authClient
          .get(Uri.parse('https://www.googleapis.com/oauth2/v1/userinfo'))
          .then((Response response) {
        var user = jsonDecode(response.body);
        print(user['name'] + user['email']);
        Functions functions = Functions();
        functions.checkAndCreateAccount(user['name'], user['email'], context);
      client.close();
      });
    });
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
                User? user;
                if (Platform.isWindows) {
                  // user = null;
                  _loginWindowsDesktop();
                } else {
                  user = await WebAuthenticationSignIN.signInWithGoogle(
                      context: context);
                  if (user != null) {
                    Functions functions = Functions();

                    functions.checkAndCreateAccount(
                        user.displayName!, user.email!, context);
                  }
                }

                // User? user = await WebAuthenticationSignIN.signInWithGoogle(
                //     context: context);
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
