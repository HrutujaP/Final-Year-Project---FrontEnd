import 'package:diskspacerenting/Constants/constants.dart';
import 'package:diskspacerenting/screens/HomeScreen/components/blockchainvideoloop.dart';
import 'package:diskspacerenting/screens/HomeScreen/components/bottomdotbar.dart';
import 'package:diskspacerenting/screens/HomeScreen/components/mainoptions.dart';
import 'package:diskspacerenting/screens/HomeScreen/components/topbaritems.dart';
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
  double _spherePosition = 0;
  int _currentPage = 1;
  PageController _pageController = PageController(initialPage: 1);

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    );
    _animationController.addListener(() {
      setState(() {
        _spherePosition = _animationController.value * 200;
      });
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
        color: Color(0xff150a34),
        gradient: LinearGradient(
          colors: [
            Color(0xff150a34),
            Color(0xff150a34),
            Color(0xff150a34),
            Color(0xff150a34),
            Color(0xff150a34),
            // Color(0xffD331BB),
            // Color(0xffD331BB),
            kPrimaryColor1,
            kPrimaryColor1,
            Color(0xff150a34),
            Color(0xff150a34)
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16),
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
              Row(
                children: [
                  Text(
                    'DSR',
                    style: TextStyle(
                        fontSize: 38,
                        color: Colors.grey.shade200,
                        fontWeight: FontWeight.w600),
                  ),
                  const Spacer(),
                  const TopBarItems(
                    color: kPrimaryColor1,
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const BlockChainVideoLoop(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
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
                            color: Colors.white,
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
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              // Column(
              //   children: [
              //     Container(
              //       decoration: BoxDecoration(
              //         color: Colors.grey[900]?.withOpacity(0.6),
              //         borderRadius: const BorderRadius.only(
              //             topLeft: Radius.circular(20),
              //             topRight: Radius.circular(20)),
              //       ),
              //       child: SizedBox(
              //         height: MediaQuery.of(context).size.height * 0.06,
              //         child: Padding(
              //           padding: const EdgeInsets.symmetric(
              //               vertical: 8.0, horizontal: 25),
              //           child: Row(
              //             children: [
              //               Text(
              //                 'Balances',
              //                 style: TextStyle(
              //                     color: Colors.grey.shade100,
              //                     fontSize: 20,
              //                     fontWeight: FontWeight.w600),
              //               ),
              //               const Spacer(),
              //               Icon(
              //                 Icons.help_rounded,
              //                 color: Colors.grey.shade200,
              //                 size: MediaQuery.of(context).size.height * 0.03,
              //               ),
              //             ],
              //           ),
              //         ),
              //       ),
              //     ),
              //     Container(
              //       decoration: BoxDecoration(
              //         color: Colors.grey[400]?.withOpacity(0.3),
              //         borderRadius: const BorderRadius.only(
              //             bottomLeft: Radius.circular(20),
              //             bottomRight: Radius.circular(20)),
              //       ),
              //       child: SizedBox(
              //         height: MediaQuery.of(context).size.height * 0.13,
              //         child: Column(
              //           mainAxisAlignment: MainAxisAlignment.center,
              //           children: [
              //             Padding(
              //               padding: const EdgeInsets.symmetric(
              //                   horizontal: 14.0, vertical: 10),
              //               child: Row(
              //                 children: [
              //                   Icon(
              //                     Icons.token_outlined,
              //                     color: Colors.amber,
              //                     size: MediaQuery.of(context).size.height *
              //                         0.035,
              //                   ),
              //                   SizedBox(
              //                     width:
              //                         MediaQuery.of(context).size.width * 0.05,
              //                   ),
              //                   Text('DSR Token',
              //                       style: TextStyle(
              //                           color: Colors.grey.shade200,
              //                           fontSize: 16,
              //                           fontWeight: FontWeight.bold)),
              //                   const Spacer(),
              //                   Text('82,176',
              //                       style: TextStyle(
              //                           color: Colors.grey.shade200,
              //                           fontSize: 18,
              //                           fontWeight: FontWeight.bold)),
              //                 ],
              //               ),
              //             ),
              //             Padding(
              //               padding: const EdgeInsets.symmetric(
              //                   horizontal: 14.0, vertical: 10),
              //               child: Row(
              //                 children: [
              //                   Icon(
              //                     Icons.storm_sharp,
              //                     color: Colors.greenAccent,
              //                     size: MediaQuery.of(context).size.height *
              //                         0.035,
              //                   ),
              //                   SizedBox(
              //                     width:
              //                         MediaQuery.of(context).size.width * 0.02,
              //                   ),
              //                   Text('Storage Rented',
              //                       style: TextStyle(
              //                           color: Colors.grey.shade200,
              //                           fontSize: 16,
              //                           fontWeight: FontWeight.bold)),
              //                   const Spacer(),
              //                   Text('32 GB',
              //                       style: TextStyle(
              //                           color: Colors.grey.shade200,
              //                           fontSize: 18,
              //                           fontWeight: FontWeight.bold)),
              //                 ],
              //               ),
              //             )
              //           ],
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: 40,
                        child: IconButton(
                          icon: Icon(
                            Icons.arrow_back_ios_rounded,
                            size: 35,
                            color: Colors.grey.shade100,
                          ),
                          onPressed: () {
                            _pageController.previousPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.ease,
                            );
                          },
                        ),
                      ),
                      SizedBox(
                          height: 250,
                          width: MediaQuery.of(context).size.width * 0.6,
                          child: PageView(
                            controller: _pageController,
                            scrollDirection: Axis.horizontal,
                            physics: const BouncingScrollPhysics(),
                            children: const [
                              MainOptions(
                                color: Color(0xffD331BB),
                                icon: Icons.currency_exchange_sharp,
                                hText: 'Rent',
                                pText:
                                    'Rent out your diskspace to other users and earn DSR tokens!',
                              ),
                              MainOptions(
                                color: Color(0xff0FDFE5),
                                icon: Icons.payment,
                                hText: 'Buy',
                                pText:
                                    'Buy diskspace from other users and store your data securely!',
                              ),
                              MainOptions(
                                  color: Color(0xffC9BFD8),
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
                      SizedBox(
                        width: 40,
                        child: IconButton(
                          icon: Transform.rotate(
                            angle: 3.14,
                            child: Icon(
                              Icons.arrow_back_ios_rounded,
                              size: 35,
                              color: Colors.grey.shade100,
                            ),
                          ),
                          onPressed: () {
                            _pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.ease,
                            );
                          },
                        ),
                      )
                    ],
                  ),
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
      ..shader = RadialGradient(
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
