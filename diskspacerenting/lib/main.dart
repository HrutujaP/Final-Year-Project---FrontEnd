import 'package:diskspacerenting/screens/FileStorage/fileStorage.dart';
import 'package:diskspacerenting/screens/HomeScreen/homescreen.dart';
<<<<<<< HEAD
import 'package:diskspacerenting/screens/LoginScreen/loginScreen.dart';
=======
import 'package:diskspacerenting/screens/MarketPlaceScreen/marketplacescreen.dart';
import 'package:diskspacerenting/screens/MyStoragesScreen/mystorages.dart';
>>>>>>> 25ee33d1acbc9cdd280ed1759840ef11011589af
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
<<<<<<< HEAD
      // initialRoute: HomeScreen.id,
      // initialRoute: fileStoarage.id,
      initialRoute: loginScreen.id,
      routes: {
        HomeScreen.id: (context) => const HomeScreen(),
        fileStoarage.id: (context) => const fileStoarage(),
        loginScreen.id: (context) => const loginScreen(),
=======
      initialRoute: MarketPlaceScreen.id,
      // initialRoute: FileStoarage.id,
      routes: {
        HomeScreen.id: (context) => const HomeScreen(),
        FileStoarage.id: (context) => const FileStoarage(),
        MyStorages.id: (context) => const MyStorages(),
        MarketPlaceScreen.id: (context) => MarketPlaceScreen(),
>>>>>>> 25ee33d1acbc9cdd280ed1759840ef11011589af
      },
    );
  }
}
