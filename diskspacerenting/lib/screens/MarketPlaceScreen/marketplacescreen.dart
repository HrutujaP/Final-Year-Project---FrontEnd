import 'package:diskspacerenting/Constants/constants.dart';
import 'package:diskspacerenting/screens/MarketPlaceScreen/components/topwidgetcard.dart';
import 'package:diskspacerenting/screens/MarketPlaceScreen/components/productcollections.dart';
import 'package:flutter/material.dart';

class MarketPlaceScreen extends StatelessWidget {
  static const String id = 'marketplacescreen';
  const MarketPlaceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            color: kPrimaryColor2,
            gradient: LinearGradient(
              colors: [
                kBackgroundStartColor,
                kBackgroundEndColor,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TopWidgetCard(),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(top: 20.0, left: 18, right: 18),
                child: Row(
                  children: const [
                    Text('Our Collections',
                        style: TextStyle(
                          color: kTextColor,
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        )),
                    SizedBox(
                      width: 15,
                    ),
                    Icon(
                      Icons.stream_outlined,
                      color: kSecondaryColor,
                      size: 28,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18.0, right: 18, top: 10),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.55,
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    physics: const BouncingScrollPhysics(),
                    children: const [
                      ProductCollections(),
                      SizedBox(
                        height: 15,
                      ),
                      ProductCollections(),
                      SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
