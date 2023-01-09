import 'package:flutter/material.dart';
import 'package:slide_to_act/slide_to_act.dart';

class SlideToPay extends StatefulWidget {
  const SlideToPay({
    Key? key,
  }) : super(key: key);

  @override
  State<SlideToPay> createState() => _SlideToPayState();
}

class _SlideToPayState extends State<SlideToPay> {
  double _sliderValue = 0.0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        // height: 50,
        width: 300,
        child: SlideAction(
          elevation: 5,
          innerColor: Colors.white,
          outerColor: Colors.deepPurple,
          sliderButtonIcon: const Icon(Icons.arrow_forward_ios_rounded),
          text: "Slide to Pay",
          onSubmit: () {},
        ));
  }
}
