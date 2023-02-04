import 'dart:ui';

import 'package:diskspacerenting/Constants/constants.dart';
import 'package:diskspacerenting/screens/RentStorageScreen/components/allfeatures.dart';
import 'package:diskspacerenting/screens/RentStorageScreen/components/pricerentbar.dart';
import 'package:diskspacerenting/screens/RentStorageScreen/components/sla.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailsMainCard extends StatelessWidget {
  const DetailsMainCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.7,
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
            child: Column(children: [
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
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Padding(
                padding: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width * 0.3),
                child: Text(
                  'STORAGE NAME',
                  softWrap: true,
                  style: TextStyle(
                    fontFamily: 'sans-serif',
                    fontWeight: FontWeight.w800,
                    color: kTextColor,
                    fontSize: MediaQuery.of(context).size.width * 0.1,
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.025,
              ),
              SLA(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.015,
              ),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus scelerisque urna sed dui accumsan dictum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae.',
                softWrap: true,
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.02,
                    color: kContrastColor),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              const AllFeatures(),
              const Spacer(),
              PriceRentBar(),
            ]),
          ),
        ),
      ),
    );
  }
}
