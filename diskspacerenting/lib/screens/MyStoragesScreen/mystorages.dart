import 'package:diskspacerenting/Constants/constants.dart';
import 'package:diskspacerenting/screens/HomeScreen/components/topbar.dart';
import 'package:diskspacerenting/screens/MyStoragesScreen/components/singledevice.dart';
import 'package:diskspacerenting/screens/MyStoragesScreen/components/storageradialgraph.dart';
import 'package:flutter/material.dart';

class MyStorages extends StatefulWidget {
  static const String id = 'mystorages';

  const MyStorages({super.key});

  @override
  State<MyStorages> createState() => _MyStoragesState();
}

class _MyStoragesState extends State<MyStorages> {
  List<ChartData> chartData = [
    ChartData('Rem', 22, '100%', kPrimaryColor2),
    ChartData('Used', 10, '100%', kSecondaryColor3),
    ChartData('Total', 32, '100%', kSecondaryColor2),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            color: kPrimaryColor2,
            gradient: LinearGradient(
              colors: [
                kPrimaryColor,
                kPrimaryColor1,
                kPrimaryColor1,
                kPrimaryColor,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TopBar(
                  color: kSecondaryColor3,
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: Colors.white,
                        size: 28,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.05,
                    ),
                    const Text('My Storages',
                        style: TextStyle(
                            color: kPrimaryColor5,
                            fontSize: 25,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
                StorageRadialGraph(chartData: chartData),
                const SizedBox(height: 20),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.451,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    physics: const BouncingScrollPhysics(),
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      var img = index % 4;

                      return SingleDeive(
                        img: img.toString(),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
