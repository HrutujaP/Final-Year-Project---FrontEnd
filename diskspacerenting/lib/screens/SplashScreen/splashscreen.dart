import 'package:diskspacerenting/Constants/Constant%20Variables/constants.dart';
import 'package:floating_bubbles/floating_bubbles.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({
    super.key,
  });

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Positioned.fill(
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  kBackgroundStartColor,
                  kBackgroundEndColor,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
        ),
         Positioned.fill(
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
            ),
        Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: ScaleTransition(
                scale: Tween<double>(
                  begin: 0.5,
                  end: 1.0,
                ).animate(_animationController),
                child: RotationTransition(
                  turns: Tween<double>(
                    begin: 0.0,
                    end: 1.0,
                  ).animate(_animationController),
                  child: Image.asset(
                    'assets/images/splashlogo.png',
                    fit: BoxFit.cover,
                    height: MediaQuery.of(context).size.width * 0.5,
                    width: MediaQuery.of(context).size.width * 0.5,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Loading...",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            )
          ],
        ))
      ],
    ));
  }
}
