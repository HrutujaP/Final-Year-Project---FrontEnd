import 'dart:ui';

import 'package:diskspacerenting/Constants/constants.dart';
import 'package:diskspacerenting/screens/Components/topbar.dart';
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
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    kBackgroundStartColor,
                    kBackgroundEndColor,
                  ],
                ),
              ),
            ),
          ),
          Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const TopBar(color: kContainerEndColor),
              // SizedBox(height: MediaQuery.of(context).size.height * 0.04),
              const Spacer(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.84,
                child: Column(
                  children: [
                    const Spacer(),
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
                              gradient: const LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  kContainerStartColor,
                                  kContainerMiddleColor,
                                  kContainerEndColor
                                ],
                              ),
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
