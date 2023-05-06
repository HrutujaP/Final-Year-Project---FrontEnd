import 'dart:ui';

import 'package:diskspacerenting/Constants/Constant%20Variables/constants.dart';
import 'package:diskspacerenting/Constants/Responsive/responsiveWidget.dart';
import 'package:diskspacerenting/models/account.dart';
import 'package:diskspacerenting/models/storage.dart';
import 'package:diskspacerenting/screens/Components/topbar.dart';
import 'package:diskspacerenting/screens/RentStorageScreen/components/detailsmaincard.dart';
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
              ResponsiveWidget.isSmallScreen(context)
                  ? const TopBar(color: kContainerEndColor)
                  : const SizedBox(),
              // SizedBox(height: MediaQuery.of(context).size.height * 0.04),
              ResponsiveWidget.isSmallScreen(context)
                  ? const Spacer()
                  : const SizedBox(),
              SizedBox(
                height: ResponsiveWidget.isSmallScreen(context)
                    ? MediaQuery.of(context).size.height * 0.84
                    : MediaQuery.of(context).size.height,
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
                    DetailsMainCard(
                      account: widget.account,
                      storage: widget.storage,
                    ),
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
