import 'dart:io';

import 'package:diskspacerenting/Functions/functions.dart';
import 'package:diskspacerenting/models/account.dart';
import 'package:diskspacerenting/screens/HomeScreen/homescreen.dart';
import 'package:diskspacerenting/screens/GoogleSignInScreen/googleSignInScreen.dart';
import 'package:diskspacerenting/screens/SplashScreen/splashscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firedart/firedart.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'firebase_options.dart';

void main() async {
  const projectId = "disk-space-renting";
  WidgetsFlutterBinding.ensureInitialized();

  if (!Platform.isWindows) {
    Firestore.initialize(projectId);
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } else {
    Firestore.initialize(projectId);
  }

  await [
    Permission.storage,
    Permission.manageExternalStorage,
    
  ].request();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Widget intialWidget = const registerScreen();

  Future<void> checkSavedUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? id = prefs.getString("Id");
    print(id);
    Account? account;
    if (id != null) {
      Functions function = Functions();
      account = await function.readAccountDetails(id);

      if (account == null) {
        print("Account not found");
        intialWidget = const registerScreen();
      } else {
        print("Account found");
        intialWidget = HomeScreen(account: account);
      }
    } else {
      print("User id not found");
      intialWidget = const registerScreen();
    }

    await Future.delayed(const Duration(seconds: 3));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(
          future: checkSavedUser(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const SplashScreen();
            } else {
              return intialWidget;
            }
          }),
      routes: {
        registerScreen.id: (context) => const registerScreen(),
      },
    );
  }
}
