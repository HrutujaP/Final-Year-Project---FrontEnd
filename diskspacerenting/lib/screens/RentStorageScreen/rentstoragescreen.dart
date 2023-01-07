import 'dart:ui';

import 'package:diskspacerenting/Constants/constants.dart';
import 'package:diskspacerenting/screens/HomeScreen/components/topbar.dart';
import 'package:diskspacerenting/screens/RentStorageScreen/components/detailsmaincard.dart';
import 'package:flutter/material.dart';
class RentStorageScreen extends StatelessWidget {
  static const String id = 'rentstoragescreen';

  const RentStorageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(children: [
          SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: const Image(
                image: AssetImage('assets/images/buy_bg.png'),
                fit: BoxFit.fill,
              )),
          Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 16.0, left: 16, right: 16),
                child: TopBar(color: kColor1),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.846283,
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: ClipRect(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.09,
                            width: MediaQuery.of(context).size.height * 0.09,
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(
                                  MediaQuery.of(context).size.height * 0.09),
                            ),
                            child: Icon(
                              Icons.arrow_back,
                              color: kSecondaryColor,
                              size: MediaQuery.of(context).size.height * 0.05,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    const DetailsMainCard(),
                  ],
                ),
              )
            ],
          ),
        ]),
      ),
    );
  }
}



