import 'package:diskspacerenting/Constants/constants.dart';
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TopBar(color: kContainerStartColor),
              SizedBox(height: MediaQuery.of(context).size.height * 0.025),
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
          ),
        ),
      ),
    );
  }
}
