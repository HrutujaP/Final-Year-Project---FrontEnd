import 'package:diskspacerenting/Constants/Constant%20Variables/constants.dart';
import 'package:diskspacerenting/Constants/Responsive/responsiveWidget.dart';
import 'package:diskspacerenting/screens/Components/topbar.dart';
import 'package:diskspacerenting/screens/Components/datepicker.dart';
import 'package:diskspacerenting/screens/PaymentScreen/components/paymentsection.dart';
import 'package:diskspacerenting/screens/PaymentScreen/components/slidetopay.dart';
import 'package:flutter/material.dart';

class PaymentScreen extends StatelessWidget {
  static const String id = 'paymentscreen';
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: kContainerMiddleColor,
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  kBackgroundStartColor,
                  kBackgroundEndColor,
                ],
              ),
            ),
            child: ResponsiveWidget.isSmallScreen(context)
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const TopBar(color: kContainerStartColor),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.025),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: DatePicker(),
                      ),
                      const Spacer(),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: PaymentSection(),
                      ),
                      const Spacer(),
                      const Center(child: SlideToPay()),
                      const SizedBox(height: 20),
                    ],
                  )
                : SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        const Spacer(
                          flex: 1,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 16),
                              child: DatePicker(),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 16),
                              child: PaymentSection(),
                            ),
                          ],
                        ),
                        const Spacer(
                          flex: 2,
                        ),
                        const Center(child: SlideToPay()),
                        const SizedBox(width: 20),
                        const Spacer(
                          flex: 1,
                        )
                      ],
                    ),
                  )),
      ),
    );
  }
}
