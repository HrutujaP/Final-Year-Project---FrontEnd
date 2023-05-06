import 'dart:ui';

import 'package:diskspacerenting/Constants/Constant%20Variables/constants.dart';
import 'package:diskspacerenting/Constants/Responsive/responsiveWidget.dart';
import 'package:diskspacerenting/models/account.dart';
import 'package:diskspacerenting/models/storage.dart';
import 'package:diskspacerenting/screens/RentStorageScreen/components/allfeatures.dart';
import 'package:diskspacerenting/screens/RentStorageScreen/components/pricerentbar.dart';
import 'package:diskspacerenting/screens/RentStorageScreen/components/sla.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailsMainCard extends StatelessWidget {
  Storage storage;
  Account account;
  DetailsMainCard({
    required this.storage,
    required this.account,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Container(
          height: ResponsiveWidget.isSmallScreen(context)
              ? MediaQuery.of(context).size.height * 0.7
              : MediaQuery.of(context).size.height * 0.85,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                kContainerStartColor.withOpacity(0.5),
                kContainerMiddleColor.withOpacity(0.5),
                kContainerEndColor.withOpacity(0.5)
              ],
            ),
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(40), topRight: Radius.circular(40)),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(
                      (Icons.sunny_snowing),
                      color: Colors.grey.shade200,
                      size: MediaQuery.of(context).size.height * 0.04,
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                    Text('Rent Storage',
                        style: GoogleFonts.poppins(
                            color: Colors.grey.shade200,
                            fontSize: MediaQuery.of(context).size.height * 0.02,
                            fontWeight: FontWeight.w600)),
                  ],
                ),
              ),
              SizedBox(
                height: ResponsiveWidget.isSmallScreen(context)
                    ? MediaQuery.of(context).size.height * 0.01
                    : 0,
              ),
              Padding(
                padding: EdgeInsets.only(
                  right: ResponsiveWidget.isSmallScreen(context)
                      ? MediaQuery.of(context).size.width * 0.3
                      : MediaQuery.of(context).size.width * 0.0,
                ),
                child: Text(
                  storage.name,
                  softWrap: true,
                  style: TextStyle(
                    fontFamily: 'sans-serif',
                    fontWeight: FontWeight.w800,
                    color: kTextColor,
                    fontSize: ResponsiveWidget.isSmallScreen(context)
                        ? MediaQuery.of(context).size.width * 0.1
                        : MediaQuery.of(context).size.width * 0.03,
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.025,
              ),
              const SLA(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.015,
              ),
              SizedBox(
                width: ResponsiveWidget.isSmallScreen(context)
                    ? MediaQuery.of(context).size.width
                    : MediaQuery.of(context).size.width * 0.5,
                child: Text(
                  storage.description,
                  softWrap: true,
                  style: TextStyle(
                      fontSize: ResponsiveWidget.isSmallScreen(context)
                          ? MediaQuery.of(context).size.height * 0.02
                          : MediaQuery.of(context).size.width * 0.015,
                      color: kBackgroundStartColor),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              const Spacer(
                flex: 2,
              ),
              AllFeatures(
                storage: storage,
              ),
              const Spacer(
                flex: 1,
              ),
              PriceRentBar(
                account: account,
                storage: storage,
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
