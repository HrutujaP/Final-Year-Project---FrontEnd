import 'package:diskspacerenting/Authentication/googleSignIn.dart';
import 'package:diskspacerenting/Constants/Constant%20Variables/constants.dart';
import 'package:diskspacerenting/screens/Components/topbaritems.dart';
import 'package:diskspacerenting/screens/HomeScreen/components/blockchainvideoloop.dart';
import 'package:diskspacerenting/screens/HomeScreen/components/mainoptions.dart';
import 'package:diskspacerenting/screens/MarketPlaceScreen/marketplacescreen.dart';
import 'package:diskspacerenting/screens/MyStoragesScreen/mystorages.dart';
import 'package:diskspacerenting/screens/PostAdvertisment/postAdvertisment.dart';
import 'package:floating_bubbles/floating_bubbles.dart';
import 'package:flutter/material.dart';

import '../../Constants/Responsive/responsiveWidget.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'home_screen';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  // int _currentPage = 1;
  // final PageController _pageController = PageController(initialPage: 1);

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );
    _animationController.addListener(() {
      setState(() {});
    });
    _animationController.repeat();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              elevation: 10,
              toolbarHeight: 50,
              shadowColor: kContainerEndColor,
              flexibleSpace: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: <Color>[
                      // kBackgroundEndColor.withOpacity(0.9),
                      kContainerStartColor,
                      kContainerMiddleColor,
                      kContainerEndColor,
                    ],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Text(
                        ResponsiveWidget.isSmallScreen(context)
                            ? 'D.S.R'
                            : 'Disk Space Renting',
                        style: const TextStyle(
                          fontSize: 38,
                          color: kBackgroundEndColor,
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.none,
                        ),
                      ),
                      const Spacer(),
                      const TopBarItems(
                        color: kBackgroundEndColor,
                      )
                    ],
                  ),
                ),
              ),
            ),
            body: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    kBackgroundStartColor,
                    kBackgroundEndColor,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Stack(children: [
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
                Row(
                  children: [
                    SizedBox(
                      width: ResponsiveWidget.isSmallScreen(context)
                          ? MediaQuery.of(context).size.width
                          : MediaQuery.of(context).size.width / 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          // const TopBar(color: kContainerEndColor),
                          ResponsiveWidget.isSmallScreen(context)
                              ? const BlockChainVideoLoop()
                              : const Center(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Experience the future of storage with blockchain-powered diskspace rentals.',
                              style: TextStyle(
                                letterSpacing: 2,
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.025,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w600,
                                foreground: Paint()..shader = linearGradient,
                              ),
                              textAlign: TextAlign.center,
                              softWrap: true,
                            ),
                          ),
                          const Divider(
                            color: kContainerMiddleColor,
                            indent: 100,
                            endIndent: 100,
                          ),

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'What do you like to check out with us today?',
                              style: TextStyle(
                                letterSpacing: 2,
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.025,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w600,
                                foreground: Paint()..shader = linearGradient,
                              ),
                              textAlign: TextAlign.center,
                              softWrap: true,
                            ),
                          ),
                          // const Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Material(
                                elevation: 10,
                                color: Colors.transparent,
                                shadowColor: kContainerEndColor,
                                borderRadius: BorderRadius.circular(65),
                                child: CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  radius:
                                      ResponsiveWidget.isSmallScreen(context) ||
                                              ResponsiveWidget.isMediumScreen(
                                                  context)
                                          ? 55
                                          : 65,
                                  child: const MainOptions(
                                    route: postAdvertisment.id,
                                    color: kTextDarkColor,
                                    icon: Icons.currency_exchange_sharp,
                                    hText: 'Rent',
                                    pText:
                                        'Rent out your diskspace to other users and earn DSR tokens!',
                                  ),
                                ),
                              ),
                              Material(
                                elevation: 10,
                                color: Colors.transparent,
                                shadowColor: kContainerEndColor,
                                borderRadius: BorderRadius.circular(65),
                                child: CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  radius:
                                      ResponsiveWidget.isSmallScreen(context) ||
                                              ResponsiveWidget.isMediumScreen(
                                                  context)
                                          ? 55
                                          : 65,
                                  child: const MainOptions(
                                    route: MarketPlaceScreen.id,
                                    color: kTextDarkColor,
                                    icon: Icons.payment,
                                    hText: 'Buy',
                                    pText:
                                        'Buy diskspace from other users and store your data securely!',
                                  ),
                                ),
                              ),
                              Material(
                                elevation: 10,
                                color: Colors.transparent,
                                shadowColor: kContainerEndColor,
                                borderRadius: BorderRadius.circular(65),
                                child: CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  radius:
                                      ResponsiveWidget.isSmallScreen(context) ||
                                              ResponsiveWidget.isMediumScreen(
                                                  context)
                                          ? 55
                                          : 65,
                                  child: const MainOptions(
                                      route: MyStorages.id,
                                      color: kTextDarkColor,
                                      icon: Icons.storage_rounded,
                                      hText: 'My\nStorage',
                                      pText:
                                          'View your rented diskspace and manage your data!'),
                                ),
                              ),
                            ],
                          ),
                          // const Spacer(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        kContainerStartColor.withOpacity(0.6),
                                        kContainerMiddleColor.withOpacity(0.6),
                                        kContainerEndColor.withOpacity(0.6),
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.topRight,
                                    ),
                                    border: Border.all(
                                      color: kBackgroundEndColor,
                                      width: 1,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20)),
                                  ),
                                  child: SizedBox(
                                    // height: MediaQuery.of(context).size.height * 0.042,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8.0, horizontal: 25),
                                      child: Row(
                                        children: [
                                          Text(
                                            'Balances',
                                            style: TextStyle(
                                                color: Colors.grey.shade100,
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.025,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          const Spacer(),
                                          Icon(
                                            Icons.help_rounded,
                                            color: Colors.grey.shade200,
                                            size: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.025,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        kContainerStartColor.withOpacity(0.6),
                                        kContainerMiddleColor.withOpacity(0.6),
                                        kContainerEndColor.withOpacity(0.6),
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.topRight,
                                    ),
                                    border: Border.all(
                                      color: kBackgroundEndColor,
                                      width: 1,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                        bottomLeft: Radius.circular(20),
                                        bottomRight: Radius.circular(20)),
                                  ),
                                  child: SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.1,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 14.0, vertical: 6),
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.token_outlined,
                                                color: Colors.amber,
                                                size: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.03,
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              const Text(
                                                'DSR Token',
                                                style: TextStyle(
                                                  color: kTextLightColor,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                textAlign: TextAlign.left,
                                              ),
                                              const Spacer(),
                                              Text('82,176',
                                                  style: TextStyle(
                                                      color:
                                                          Colors.grey.shade200,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 14.0, vertical: 8),
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.storm_sharp,
                                                color: Colors.greenAccent,
                                                size: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.028,
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              const Text('Storage Rented',
                                                  style: TextStyle(
                                                      color: kTextLightColor,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              const Spacer(),
                                              Text('32 GB',
                                                  style: TextStyle(
                                                      color:
                                                          Colors.grey.shade200,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // const Spacer(),
                          // Column(
                          //   children: [
                          //     CircleAvatar(
                          //       backgroundColor: Colors.transparent,
                          //       radius: 65,
                          //       child: PageView(
                          //         clipBehavior: Clip.none,
                          //         controller: _pageController,
                          //         scrollDirection: Axis.horizontal,
                          //         physics: const BouncingScrollPhysics(),
                          //         children: const [
                          //           MainOptions(
                          //             route: postAdvertisment.id,
                          //             color: kTextDarkColor,
                          //             icon: Icons.currency_exchange_sharp,
                          //             hText: 'Rent',
                          //             pText:
                          //                 'Rent out your diskspace to other users and earn DSR tokens!',
                          //           ),
                          //           MainOptions(
                          //             route: MarketPlaceScreen.id,
                          //             color: kTextDarkColor,
                          //             icon: Icons.payment,
                          //             hText: 'Buy',
                          //             pText:
                          //                 'Buy diskspace from other users and store your data securely!',
                          //           ),
                          //           MainOptions(
                          //               route: MyStorages.id,
                          //               color: kTextDarkColor,
                          //               icon: Icons.storage_rounded,
                          //               hText: 'My\nStorage',
                          //               pText:
                          //                   'View your rented diskspace and manage your data!')
                          //         ],
                          //         onPageChanged: (int page) {
                          //           setState(() {
                          //             _currentPage = page;
                          //           });
                          //         },
                          //       ),
                          //     ),
                          //     BottomDotBar(
                          //       currentIndex: _currentPage,
                          //       dotCount: 3,
                          //     ),
                          //   ],
                          // )
                        ],
                      ),
                    ),
                    !ResponsiveWidget.isSmallScreen(context)
                        ? SizedBox(
                            width: MediaQuery.of(context).size.width / 2,
                            child: const BlockChainVideoLoop(),
                          )
                        : const Center(),
                  ],
                ),
              ]),
            )));
  }
}

class _GradientSpherePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..shader = const RadialGradient(
        center: Alignment.topCenter,
        radius: 1,
        colors: [
          Colors.red,
          Colors.orange,
        ],
      ).createShader(Rect.fromLTRB(0, -200, size.width, 0));

    canvas.drawCircle(
      Offset(size.width / 2, 0),
      50,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
