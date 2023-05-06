// ignore_for_file: use_build_context_synchronously

import 'package:diskspacerenting/Constants/Constant%20Variables/constants.dart';
import 'package:diskspacerenting/Functions/functions.dart';
import 'package:diskspacerenting/models/account.dart';
import 'package:diskspacerenting/models/rent.dart';
import 'package:diskspacerenting/screens/HomeScreen/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:slide_to_act/slide_to_act.dart';

class SlideToPay extends StatefulWidget {
  Rent rent;
  SlideToPay({
    required this.rent,
    Key? key,
  }) : super(key: key);

  @override
  State<SlideToPay> createState() => _SlideToPayState();
}

class _SlideToPayState extends State<SlideToPay> {
  Functions functions = Functions();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: !isLoading,
      replacement: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Text(
              'Your Payment is being processed',
              softWrap: true,
              style: TextStyle(
                color: kTextLightColor,
                fontSize: 30,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            CircularProgressIndicator(
              strokeWidth: 6,
              color: kTextLightColor,
            ),
          ],
        ),
      ),
      child: SizedBox(
          // height: 50,
          width: 300,
          child: SlideAction(
            elevation: 5,
            outerColor: kContainerEndColor,
            sliderButtonIcon: const Icon(Icons.arrow_forward_ios_rounded),
            text: "Slide to Pay",
            textStyle: const TextStyle(
                color: kBackgroundEndColor,
                fontSize: 22,
                fontWeight: FontWeight.bold),
            onSubmit: () async {
              setState(() {
                isLoading = true;
              });
              await functions.rentStorage(widget.rent);
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                backgroundColor: Colors.transparent,
                content: Text(
                  'Payment Successful !  Your Storage is now Active',
                  style: TextStyle(
                    color: kTextColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                duration: Duration(seconds: 3),
              ));
              Account account =
                  await functions.readAccountDetails(widget.rent.renteeId) ??
                      Account();
              setState(() {
                isLoading = false;
              });
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => HomeScreen(
                            account: account,
                          )));
            },
          )),
    );
  }
}
