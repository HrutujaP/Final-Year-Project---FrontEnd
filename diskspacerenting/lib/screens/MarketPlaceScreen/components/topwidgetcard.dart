import 'package:diskspacerenting/Constants/Constant%20Variables/constants.dart';
import 'package:diskspacerenting/screens/Components/topbar.dart';
import 'package:flutter/material.dart';

class TopWidgetCard extends StatelessWidget {
  const TopWidgetCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          top: 15,
          left: 5,
          child: Transform(
            alignment: Alignment.center,
            transform: Matrix4.rotationZ(0.05),
            child: Container(
              decoration: BoxDecoration(
                color: kContainerStartColor.withOpacity(0.6),
                borderRadius: BorderRadius.circular(20),
              ),
              height: MediaQuery.of(context).size.height * 0.32,
              width: MediaQuery.of(context).size.width,
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.32,
          width: MediaQuery.of(context).size.width,
          child: const ClipRRect(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)),
            child: ColorFiltered(
              colorFilter:
                  ColorFilter.mode(kContainerStartColor, BlendMode.color),
              child: Image(
                image: AssetImage('assets/images/marketplace.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const TopBar(color: kSecondaryColor),
        Positioned(
          top: MediaQuery.of(context).size.height / 5,
          left: MediaQuery.of(context).size.width / 10,
          child: Container(
            decoration: BoxDecoration(
                color: kContainerEndColor.withOpacity(0.7),
                borderRadius: BorderRadius.circular(20)),
            width: MediaQuery.of(context).size.width * 0.8,
            child: const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'Take control of your digital assets with our blockchain-based disk space market.',
                softWrap: true,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: kSecondaryColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
        )
      ],
    );
  }
}
