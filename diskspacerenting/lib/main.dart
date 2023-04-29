import 'package:diskspacerenting/Functions/functions.dart';
import 'package:diskspacerenting/models/account.dart';
import 'package:diskspacerenting/screens/FileStorage/fileStorage.dart';
import 'package:diskspacerenting/screens/HomeScreen/homescreen.dart';
import 'package:diskspacerenting/screens/MarketPlaceScreen/marketplacescreen.dart';
import 'package:diskspacerenting/screens/PaymentScreen/paymentscreen.dart';
import 'package:diskspacerenting/screens/PostAdvertisment/postAdvertisment.dart';
import 'package:diskspacerenting/screens/GoogleSignInScreen/googleSignInScreen.dart';
import 'package:diskspacerenting/screens/RentStorageScreen/rentstoragescreen.dart';
import 'package:diskspacerenting/screens/SplashScreen/splashscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  Map<Permission,PermissionStatus> statuses = await [
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
    Account account = Account();
    if (id == null) {
      Functions function = Functions();
      account.Email = "test@email";
      account.Name = "test";
      account.balance = "1234";
      account.Id = "1234";
      account.ownedStorageIds = ["1", "2", "3"];
      account.rentedStorageIds = ["4", "5", "6"];
      // account = await function.readAccountDetails(id);
      intialWidget = HomeScreen(account: account);
    } else {
      print("User id not found");
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
        FileStoarage.id: (context) => const FileStoarage(),
        registerScreen.id: (context) => const registerScreen(),
        MarketPlaceScreen.id: (context) => const MarketPlaceScreen(),
        postAdvertisment.id: (context) => const postAdvertisment(),
        RentStorageScreen.id: (context) => const RentStorageScreen(),
        PaymentScreen.id: (context) => const PaymentScreen(),
      },
    );
  }
}
