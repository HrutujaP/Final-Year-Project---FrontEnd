import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diskspacerenting/screens/FileStorage/fileStorage.dart';
import 'package:diskspacerenting/screens/HomeScreen/homescreen.dart';
import 'package:diskspacerenting/screens/LoginScreen/loginScreen.dart';
import 'package:diskspacerenting/screens/MarketPlaceScreen/marketplacescreen.dart';
import 'package:diskspacerenting/screens/MyStoragesScreen/mystorages.dart';
import 'package:diskspacerenting/screens/PaymentScreen/paymentscreen.dart';
import 'package:diskspacerenting/screens/PostAdvertisment/postAdvertisment.dart';
import 'package:diskspacerenting/screens/RegisterScreen/registerScreen.dart';
import 'package:diskspacerenting/screens/RentStorageScreen/rentstoragescreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseFirestore.instance
      .collection("collectionPath")
      .doc("documentId")
      .set({
    "key1": "value1",
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.id,
      // initialRoute: registerScreen.id,

      routes: {
        HomeScreen.id: (context) => const HomeScreen(),
        FileStoarage.id: (context) => const FileStoarage(),
        MyStorages.id: (context) => const MyStorages(),
        loginScreen.id: (context) => const loginScreen(),
        registerScreen.id: (context) => const registerScreen(),
        MarketPlaceScreen.id: (context) => const MarketPlaceScreen(),
        postAdvertisment.id: (context) => const postAdvertisment(),
        RentStorageScreen.id: (context) => const RentStorageScreen(),
        PaymentScreen.id: (context) => const PaymentScreen(),
      },
    );
  }
}
