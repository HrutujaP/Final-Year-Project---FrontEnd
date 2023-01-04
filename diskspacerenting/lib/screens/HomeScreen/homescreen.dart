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

class _HomeScreenState extends State<HomeScreen> {
  int _currentPage = 1;
  PageController _pageController = PageController(initialPage: 1);

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
            Color(0xffD331BB),
            Color(0xff150a34)
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'DSR',
                  style: TextStyle(fontSize: 40, color: Colors.grey.shade200),
                ),
                const Spacer(),
                const TopBarItems(
                  color: Color.fromARGB(255, 255, 59, 226),
                )
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.35,
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
                const Spacer(),
                const BlockChainVideoLoop()
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _currentPage > 0
                    ? SizedBox(
                        width: 40,
                        child: IconButton(
                          icon: const Icon(
                            Icons.arrow_back_ios_rounded,
                            size: 30,
                            color: Color.fromARGB(255, 62, 24, 168),
                          ),
                          onPressed: () {
                            _pageController.previousPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.ease,
                            );
                          },
                        ),
                      )
                    : const SizedBox(
                        width: 40,
                      ),
                SizedBox(
                    height: 260,
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
                            icon: Icons.storage,
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
                _currentPage < 2
                    ? SizedBox(
                        width: 40,
                        child: IconButton(
                          icon: Transform.rotate(
                            angle: 3.14,
                            child: const Icon(
                              Icons.arrow_back_ios_rounded,
                              size: 30,
                              color: Color.fromARGB(255, 62, 24, 168),
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
                    : const SizedBox(
                        width: 40,
                      ),
              ],
            ),
            BottomDotBar(
              currentIndex: _currentPage,
              dotCount: 3,
            ),
          ],
        ),
      ),
    )));
  }
}
