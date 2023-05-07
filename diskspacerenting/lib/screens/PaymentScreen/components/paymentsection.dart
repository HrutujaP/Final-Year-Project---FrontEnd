import 'package:diskspacerenting/Constants/Constant%20Variables/constants.dart';
import 'package:diskspacerenting/Constants/Responsive/responsiveWidget.dart';
import 'package:diskspacerenting/models/account.dart';
import 'package:diskspacerenting/models/rent.dart';
import 'package:diskspacerenting/models/storage.dart';
import 'package:flutter/material.dart';

class PaymentSection extends StatelessWidget {
  Storage storage;
  Account account;
  Rent rent;
  PaymentSection({
    required this.storage,
    required this.account,
    required this.rent,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ResponsiveWidget.isSmallScreen(context)
          ? MediaQuery.of(context).size.height * 0.28
          : MediaQuery.of(context).size.height * 0.55,
      width: ResponsiveWidget.isSmallScreen(context)
          ? MediaQuery.of(context).size.width
          : MediaQuery.of(context).size.width * 0.46,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              kContainerStartColor.withOpacity(0.5),
              kContainerMiddleColor.withOpacity(0.5),
              kContainerEndColor.withOpacity(0.5),
            ],
          ),
          borderRadius:
              BorderRadius.circular(MediaQuery.of(context).size.height * 0.04),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: ResponsiveWidget.isSmallScreen(context)
                  ? MediaQuery.of(context).size.height * 0.16
                  : MediaQuery.of(context).size.height * 0.25,
              // width:,
              child: Container(
                decoration: BoxDecoration(
                  color: kContainerStartColor,
                  borderRadius: BorderRadius.circular(
                      MediaQuery.of(context).size.height * 0.04),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.wallet,
                                color: kContainerStartColor),
                            const SizedBox(width: 10),
                            Text(
                              'Subscriptions wallet',
                              style: TextStyle(
                                  fontSize:
                                      ResponsiveWidget.isSmallScreen(context)
                                          ? MediaQuery.of(context).size.height *
                                              0.018
                                          : MediaQuery.of(context).size.height *
                                              0.03,
                                  color: kTextLightColor,
                                  fontWeight: FontWeight.bold),
                            ),
                            const Spacer(
                              flex: 8,
                            ),
                            const Icon(
                              Icons.circle_outlined,
                              color: Color.fromARGB(255, 41, 33, 75),
                              size: 30,
                            ),
                            const Spacer()
                          ],
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                              'Available balance: DSR ${account.balance}',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: kTextDarkColor,
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.026)),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            children: [
                              Text('Total Cost',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: kTextDarkColor,
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.025)),
                              Text(' DSR ${storage.price}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      color: kBackgroundEndColor,
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.03)),
                            ],
                          ),
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            children: [
                              Text(
                                'Monthly expenses: DSR ${storage.price}',
                                style: TextStyle(
                                    color: kContainerEndColor,
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.022,
                                    fontWeight: FontWeight.bold),
                              ),
                              ResponsiveWidget.isSmallScreen(context)
                                  ? const Spacer()
                                  : const SizedBox(width: 10),
                              const Icon(Icons.remove_red_eye_outlined)
                            ],
                          ),
                        )
                      ]),
                ),
              ),
            ),
          ),
          const Spacer(),
          Center(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.add_circle,
                  color: kSecondaryColor,
                  size: 30,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Add funds',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                )
              ],
            ),
          ),
          const Spacer()
        ]),
      ),
    );
  }
}
