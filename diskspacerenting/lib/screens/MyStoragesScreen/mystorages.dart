import 'package:diskspacerenting/Constants/Constant%20Variables/constants.dart';
import 'package:diskspacerenting/screens/Components/topbar.dart';
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
    ChartData('Rem', 22, '100%', kContainerStartColor),
    ChartData('Used', 10, '100%', kContainerMiddleColor),
    ChartData('Total', 32, '100%', kContainerEndColor),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration:  const BoxDecoration(
              color: kContainerMiddleColor,
              gradient: LinearGradient(
                colors: [kBackgroundStartColor, kBackgroundEndColor],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              )),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TopBar(
                color: kContainerEndColor,
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
                    width: MediaQuery.of(context).size.width * 0.04,
                  ),
                  const Text('My Storages',
                      style: TextStyle(
                          color: kTextColor,
                          fontSize: 25,
                          fontWeight: FontWeight.bold)),
                ],
              ),
              StorageRadialGraph(chartData: chartData),
              const Spacer(),
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
    );
  }
}
