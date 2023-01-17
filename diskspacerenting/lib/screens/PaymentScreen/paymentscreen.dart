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
            color: kPrimaryColor2,
            gradient: LinearGradient(
              colors: [
                kPrimaryColor,
                kPrimaryColor,
                kPrimaryColor2,
                kPrimaryColor2,
                kPrimaryColor,
                kPrimaryColor,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TopBar(color: kPrimaryColor3),
                SizedBox(height: MediaQuery.of(context).size.height * 0.025),
                const DatePicker(),
                const Spacer(),
                const PaymentSection(),
                const Spacer(),
                const Center(child: SlideToPay()),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
