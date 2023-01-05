import 'package:diskspacerenting/screens/FileStorage/fileStorage.dart';
import 'package:diskspacerenting/screens/HomeScreen/homescreen.dart';
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
<<<<<<< HEAD
      initialRoute: HomeScreen.id,
      // initialRoute: FileStoarage.id,
=======
      // initialRoute: HomeScreen.id,
      initialRoute: fileStoarage.id,
>>>>>>> 87dadcb0cce53d86e9d9d242751c076856dd5c88
      routes: {
        HomeScreen.id: (context) => const HomeScreen(),
        FileStoarage.id: (context) => const FileStoarage(),
        MyStorages.id: (context) => const MyStorages(),
      },
    );
  }
}
