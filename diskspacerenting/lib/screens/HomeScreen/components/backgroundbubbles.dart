import 'package:diskspacerenting/Constants/Constant%20Variables/constants.dart';
import 'package:floating_bubbles/floating_bubbles.dart';
import 'package:flutter/material.dart';

class BackgroundBubbles extends StatelessWidget {
  const BackgroundBubbles({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      // top: 20,
      child: FloatingBubbles.alwaysRepeating(
        noOfBubbles: 20,
        colorsOfBubbles: const [
          kContainerStartColor,
          kContainerMiddleColor,
          // kContainerEndColor,
        ],

        sizeFactor: 0.2,
        // duration: 120, // 120 seconds.
        opacity: 100,
        paintingStyle: PaintingStyle.fill,
        strokeWidth: 8,
        shape: BubbleShape
            .circle, // circle is the default. No need to explicitly mention if its a circle.
        speed: BubbleSpeed.slow, // normal is the default
      ),
    );
  }
}
