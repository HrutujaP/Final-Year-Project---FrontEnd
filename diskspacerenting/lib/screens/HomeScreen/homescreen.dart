import 'package:diskspacerenting/Constants/constants.dart';
import 'package:diskspacerenting/screens/HomeScreen/components/blockchainvideoloop.dart';
import 'package:diskspacerenting/screens/HomeScreen/components/bottomdotbar.dart';
import 'package:diskspacerenting/screens/HomeScreen/components/mainoptions.dart';
import 'package:diskspacerenting/screens/HomeScreen/components/topbar.dart';
import 'package:diskspacerenting/screens/MarketPlaceScreen/marketplacescreen.dart';
import 'package:diskspacerenting/screens/MyStoragesScreen/mystorages.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'home_screen';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  int _currentPage = 1;
  final PageController _pageController = PageController(initialPage: 1);

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
            body: Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            // kPrimaryColor2,
            // kPrimaryColor2,
            // kPrimaryColor2,
            // kPrimaryColor2,
            // kPrimaryColor2,
            // // Color(0xffD331BB),
            // // Color(0xffD331BB),
            // kPrimaryColor1,
            // kPrimaryColor1,
            // kPrimaryColor2,
            // kPrimaryColor2
            kPrimaryColor,
            kPrimaryColor,
            kPrimaryColor,
            kSecondaryColor,
            kPrimaryColor,
            kPrimaryColor,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Stack(children: [
          // Container(
          //   height: 200,
          //   alignment: Alignment.bottomCenter,
          //   child: SingleChildScrollView(
          //     child: LayoutBuilder(
          //       builder: (context, constraints) {
          //         return Transform.translate(
          //           offset: Offset(0, _spherePosition - 200),
          //           child: CustomPaint(
          //             painter: _GradientSpherePainter(),
          //           ),
          //         );
          //       },
          //     ),
          //   ),
          // ),
          Column(
            children: [
              const TopBar(color: kSecondaryColor3),
              const BlockChainVideoLoop(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.025,
              ),
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: const Padding(
                      padding: EdgeInsets.only(right: 8.0),
                      child: Text(
                        'Experience the future of storage with blockchain-powered diskspace rentals!',
                        style: TextStyle(
                            color: kPrimaryColor6,
                            fontSize: 20,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w600),
                        softWrap: true,
                      ),
                    ),
                  ),
                  // const Spacer(),
                ],
              ),
              Spacer(),
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: kContrastColor,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                    ),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.042,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 25),
                        child: Row(
                          children: [
                            Text(
                              'Balances',
                              style: TextStyle(
                                  color: Colors.grey.shade100,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600),
                            ),
                            const Spacer(),
                            Icon(
                              Icons.help_rounded,
                              color: Colors.grey.shade200,
                              size: MediaQuery.of(context).size.height * 0.025,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: kSecondaryColor2.withOpacity(0.5),
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20)),
                    ),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 14.0, vertical: 6),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.token_outlined,
                                  color: Colors.amber,
                                  size:
                                      MediaQuery.of(context).size.height * 0.03,
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.05,
                                ),
                                Text('DSR Token',
                                    style: TextStyle(
                                        color: kPrimaryColor5,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold)),
                                const Spacer(),
                                Text('82,176',
                                    style: TextStyle(
                                        color: Colors.grey.shade200,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
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
                                  size: MediaQuery.of(context).size.height *
                                      0.028,
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.018,
                                ),
                                Text('Storage Rented',
                                    style: TextStyle(
                                        color: kPrimaryColor5,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold)),
                                const Spacer(),
                                Text('32 GB',
                                    style: TextStyle(
                                        color: Colors.grey.shade200,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Spacer(),
              Column(
                children: [
                  SizedBox(
                      height: MediaQuery.of(context).size.height * 0.305,
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: PageView(
                        controller: _pageController,
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        children: const [
                          MainOptions(
                            route: '/rent',
                            color: Color.fromARGB(255, 255, 160, 241),
                            icon: Icons.currency_exchange_sharp,
                            hText: 'Rent',
                            pText:
                                'Rent out your diskspace to other users and earn DSR tokens!',
                          ),
                          MainOptions(
                            route: MarketPlaceScreen.id,
                            color: Color.fromARGB(255, 104, 250, 255),
                            icon: Icons.payment,
                            hText: 'Buy',
                            pText:
                                'Buy diskspace from other users and store your data securely!',
                          ),
                          MainOptions(
                              route: MyStorages.id,
                              color: Color.fromARGB(255, 215, 189, 255),
                              icon: Icons.storage_rounded,
                              hText: 'My Storage',
                              pText:
                                  'View your rented diskspace and manage your data!')
                        ],
                        onPageChanged: (int page) {
                          setState(() {
                            _currentPage = page;
                          });
                        },
                      )),
                  BottomDotBar(
                    currentIndex: _currentPage,
                    dotCount: 3,
                  ),
                ],
              )
            ],
          ),
        ]),
      ),
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
