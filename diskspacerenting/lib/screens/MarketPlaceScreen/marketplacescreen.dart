import 'package:diskspacerenting/Constants/Constant%20Variables/constants.dart';
import 'package:diskspacerenting/Constants/Responsive/responsiveWidget.dart';
import 'package:diskspacerenting/models/account.dart';
import 'package:diskspacerenting/screens/MarketPlaceScreen/components/topwidgetcard.dart';
import 'package:diskspacerenting/screens/MarketPlaceScreen/components/productcollections.dart';
import 'package:flutter/material.dart';

class MarketPlaceScreen extends StatefulWidget {
  static const String id = 'marketplacescreen';
  Account account;
  MarketPlaceScreen({required this.account, super.key});

  @override
  State<MarketPlaceScreen> createState() => _MarketPlaceScreenState();
}

class _MarketPlaceScreenState extends State<MarketPlaceScreen> {


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.chevron_left_rounded,
              size: ResponsiveWidget.isLargeScreen(context) ? 50 : 30,
              color: kBackgroundEndColor,
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 10,
          toolbarHeight: 50,
          shadowColor: kContainerEndColor,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[
                  // kBackgroundEndColor.withOpacity(0.9),
                  kContainerStartColor,
                  kContainerMiddleColor,
                  kContainerEndColor,
                ],
              ),
            ),
          ),
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Text(
                  ResponsiveWidget.isSmallScreen(context)
                      ? 'D.S.R'
                      : 'Disk Space Renting',
                  style: const TextStyle(
                    fontSize: 38,
                    color: kBackgroundEndColor,
                    fontWeight: FontWeight.w600,
                    decoration: TextDecoration.none,
                  ),
                ),
                const Spacer(),
                Text(
                  "Welcome, ${widget.account.Name} ",
                  style: TextStyle(
                    fontSize: ResponsiveWidget.isSmallScreen(context) ? 18 : 22,
                    color: kBackgroundStartColor,
                    fontWeight: FontWeight.w700,
                    decoration: TextDecoration.none,
                  ),
                )
              ],
            ),
          ),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            color: kContainerMiddleColor,
            gradient: LinearGradient(
              colors: [
                kBackgroundStartColor,
                kBackgroundEndColor,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: ResponsiveWidget.isSmallScreen(context)
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TopWidgetCard(),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 20.0, left: 18, right: 18),
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
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 18.0, right: 18, top: 10),
                        child: Expanded(
                          child: SizedBox(
                            // height: MediaQuery.of(context).size.height * 0.55,
                            child: ListView(
                              scrollDirection: Axis.vertical,
                              physics: const BouncingScrollPhysics(),
                              children: [
                                ProductCollections(
                                  account: widget.account,
                                  limit: "100",
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                ProductCollections(
                                  account: widget.account,
                                  limit: "500",
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TopWidgetCard(),
                    const Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 20.0, left: 18, right: 18),
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
                          padding: const EdgeInsets.only(
                              left: 18.0, right: 18, top: 10),
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.83,
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: ListView(
                              scrollDirection: Axis.vertical,
                              physics: const BouncingScrollPhysics(),
                              children: [
                                ProductCollections(
                                  account: widget.account,
                                  limit: "100",
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                ProductCollections(
                                  account: widget.account,
                                  limit: "500",
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                ProductCollections(
                                  account: widget.account,
                                  limit: "1000",
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Spacer()
                  ],
                ),
        ),
      ),
    );
  }
}
