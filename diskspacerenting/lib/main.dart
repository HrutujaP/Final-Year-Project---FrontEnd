import 'package:diskspacerenting/screens/FileStorage/fileStorage.dart';
import 'package:diskspacerenting/screens/HomeScreen/homescreen.dart';
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
      // initialRoute: HomeScreen.id,
      initialRoute: fileStoarage.id,
      routes: {
        HomeScreen.id: (context) => const HomeScreen(),
        fileStoarage.id: (context) => const fileStoarage(),
      },
    );
  }
}
