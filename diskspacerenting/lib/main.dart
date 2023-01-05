import 'package:diskspacerenting/screens/FileStorage/fileStorage.dart';
import 'package:diskspacerenting/screens/HomeScreen/homescreen.dart';
import 'package:diskspacerenting/screens/MarketPlaceScreen/marketplacescreen.dart';
import 'package:diskspacerenting/screens/MyStoragesScreen/mystorages.dart';
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
      initialRoute: MarketPlaceScreen.id,
      // initialRoute: FileStoarage.id,
      routes: {
        HomeScreen.id: (context) => const HomeScreen(),
        FileStoarage.id: (context) => const FileStoarage(),
        MyStorages.id: (context) => const MyStorages(),
        MarketPlaceScreen.id: (context) => MarketPlaceScreen(),
      },
    );
  }
}
