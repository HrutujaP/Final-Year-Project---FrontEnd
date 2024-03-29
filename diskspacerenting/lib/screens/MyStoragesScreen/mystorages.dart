import 'package:diskspacerenting/Constants/Constant%20Variables/constants.dart';
import 'package:diskspacerenting/Constants/Responsive/responsiveWidget.dart';
import 'package:diskspacerenting/Functions/functions.dart';
import 'package:diskspacerenting/models/account.dart';
import 'package:diskspacerenting/screens/Components/topbar.dart';
import 'package:diskspacerenting/screens/MyStoragesScreen/components/desktopowned.dart';
import 'package:diskspacerenting/screens/MyStoragesScreen/components/desktoprented.dart';
import 'package:diskspacerenting/screens/MyStoragesScreen/components/mobileowned.dart';
import 'package:diskspacerenting/screens/MyStoragesScreen/components/mobilerented.dart';
import 'package:diskspacerenting/screens/MyStoragesScreen/components/storageradialgraph.dart';
import 'package:floating_bubbles/floating_bubbles.dart';
import 'package:flutter/material.dart';

class MyStorages extends StatefulWidget {
  static const String id = 'mystorages';
  Account account;

  MyStorages({required this.account, super.key});

  @override
  State<MyStorages> createState() => _MyStoragesState();
}

class _MyStoragesState extends State<MyStorages> {
  List<ChartData> chartData = [
    ChartData('Used', 10, '100%', kContainerMiddleColor),
    ChartData('Rented', 22, '100%', kContainerStartColor),
    ChartData('Total', 32, '100%', kContainerEndColor),
  ];

  late List<Widget> mobile = [];
  late List<Widget> desktop = [];

  int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);

  void _onPreviousButtonPressed() {
    if (_currentPage > 0) {
      setState(() {
        _currentPage--;
        _pageController.animateToPage(_currentPage,
            duration: const Duration(seconds: 1), curve: Curves.linear);
      });
    }
  }

  void _onNextButtonPressed() {
    if (_currentPage < mobile.length - 1) {
      setState(() {
        _currentPage++;
        _pageController.animateToPage(_currentPage,
            duration: const Duration(seconds: 1), curve: Curves.linear);
      });
    }
  }

  late List<String> rentedStorages;
  late List<String> ownedStorages;
  Functions functions = Functions();
  // functions.getAccountStorages(widget.account.Id)

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  color: kContainerMiddleColor,
                  gradient: LinearGradient(
                    colors: [kBackgroundStartColor, kBackgroundEndColor],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  )),
            ),
            Positioned.fill(
              // top: 20,
              child: FloatingBubbles.alwaysRepeating(
                noOfBubbles: 20,
                colorsOfBubbles: const [
                  kContainerStartColor,
                  kContainerMiddleColor,
                  // kContainerEndColor,
                ],

                sizeFactor: 0.2,
                // duration: 120, // 120 seconds.
                opacity: 100,
                paintingStyle: PaintingStyle.fill,
                strokeWidth: 8,
                shape: BubbleShape
                    .circle, // circle is the default. No need to explicitly mention if its a circle.
                speed: BubbleSpeed.slow, // normal is the default
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const TopBar(
                  color: kContainerEndColor,
                ),
                const Spacer(),
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.04,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text('My Storages',
                          style: TextStyle(
                              color: kSecondaryColor,
                              fontSize: ResponsiveWidget.isSmallScreen(context)
                                  ? 20
                                  : 40,
                              fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
                SizedBox(
                  height: ResponsiveWidget.isSmallScreen(context)
                      ? MediaQuery.of(context).size.height * 0.788
                      : MediaQuery.of(context).size.height * 0.83,
                  width: MediaQuery.of(context).size.width,
                  child: FutureBuilder(
                    future: functions.getAccountStorages(widget.account.Id),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        ownedStorages = snapshot.data[0];
                        rentedStorages = snapshot.data[1];
                        mobile = [
                          MobileOwned(
                            storageIds: ownedStorages,
                          ),
                          MobileRented(
                            storageIds: rentedStorages,
                          )
                        ];
                        desktop = [
                          DesktopOwned(
                            storageIds: ownedStorages,
                          ),
                          DesktopRented(
                            storageIds: rentedStorages,
                          )
                        ];

                        return ResponsiveWidget.isSmallScreen(context)
                            ? Column(
                                children: [
                                  StorageRadialGraph(chartData: chartData),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.466,
                                    width: MediaQuery.of(context).size.width,
                                    child: PageView(
                                      controller: _pageController,
                                      onPageChanged: (index) {
                                        setState(() {
                                          _currentPage = index;
                                        });
                                      },
                                      children: mobile,
                                    ),
                                  )
                                ],
                              )
                            : Row(
                                children: [
                                  StorageRadialGraph(chartData: chartData),
                                  const Spacer(),
                                  IconButton(
                                    icon: const Icon(
                                      Icons.arrow_back_ios,
                                      size: 40,
                                      color: kTextLightColor,
                                    ),
                                    onPressed: _onPreviousButtonPressed,
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height,
                                    width:
                                        MediaQuery.of(context).size.width * 0.5,
                                    child: PageView(
                                      controller: _pageController,
                                      onPageChanged: (index) {
                                        setState(() {
                                          _currentPage = index;
                                        });
                                      },
                                      children: desktop,
                                    ),
                                  ),
                                  IconButton(
                                    icon: const Icon(
                                      Icons.arrow_forward_ios,
                                      size: 40,
                                      color: kTextLightColor,
                                    ),
                                    onPressed: _onNextButtonPressed,
                                  ),
                                  const Spacer()
                                ],
                              );
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(
                            strokeWidth: 8,
                            color: kContainerMiddleColor,
                          ),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
