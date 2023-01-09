import 'package:diskspacerenting/Constants/constants.dart';
import 'package:diskspacerenting/screens/HomeScreen/components/topbar.dart';
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
                kPrimaryColor1,
                kPrimaryColor,
                kPrimaryColor1,
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
                const TopBar(color: kItemColor2),
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

