import 'dart:ui';

import 'package:diskspacerenting/Constants/Constant%20Variables/constants.dart';
import 'package:diskspacerenting/Constants/Responsive/responsiveWidget.dart';
import 'package:diskspacerenting/models/account.dart';
import 'package:diskspacerenting/models/storage.dart';
import 'package:diskspacerenting/screens/Components/topbar.dart';
import 'package:diskspacerenting/screens/RentStorageScreen/components/detailsmaincard.dart';
import 'package:floating_bubbles/floating_bubbles.dart';
import 'package:flutter/material.dart';

class RentStorageScreen extends StatefulWidget {
  static const String id = 'rentstoragescreen';
  Storage storage;
  Account account;
  RentStorageScreen({required this.storage, required this.account, super.key});

  @override
  State<RentStorageScreen> createState() => _RentStorageScreenState();
}

class _RentStorageScreenState extends State<RentStorageScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
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
          const TopBar(color: kContainerEndColor),
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
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
                DetailsMainCard(
                  account: widget.account,
                  storage: widget.storage,
                ),
              ],
            ),
          ),

          // SizedBox(height: MediaQuery.of(context).size.height * 0.04),

          const Spacer(),
        ]),
      ),
    );
  }
}
