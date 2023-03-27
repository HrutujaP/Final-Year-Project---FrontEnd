import 'dart:math';

import 'package:diskspacerenting/Constants/constants.dart';
import 'package:diskspacerenting/screens/RentStorageScreen/rentstoragescreen.dart';
import 'package:flutter/material.dart';

class IndividualProduct extends StatefulWidget {
  const IndividualProduct({
    Key? key,
  }) : super(key: key);

  @override
  State<IndividualProduct> createState() => _IndividualProductState();
}

class _IndividualProductState extends State<IndividualProduct> {
  Random random = Random();

  Color generateRandomColor() {
    return HSVColor.fromAHSV(
      0.7,
      random.nextDouble(),
      random.nextDouble(),
      random.nextDouble(),
    ).toColor();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, RentStorageScreen.id);
        },
        child: Container(
          height: MediaQuery.of(context).size.height * 0.216,
          width: MediaQuery.of(context).size.width * 0.35,
          decoration: BoxDecoration(
            color: kContainerEndColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Icon(Icons.storage_outlined,
                    color: generateRandomColor(), size: 85),
                Row(
                  children: const [
                    Text(
                      'Size',
                      style: TextStyle(
                          color: kBackgroundEndColor,
                          fontSize: 16,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600),
                    ),
                    Spacer(),
                    Text(
                      '25 GB',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          color: kContainerStartColor),
                    )
                  ],
                ),
                Row(
                  children: const [
                    Text(
                      'Price',
                      style: TextStyle(
                          color: kBackgroundEndColor,
                          fontSize: 16,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600),
                    ),
                    Spacer(),
                    Text('25',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                            color: kContainerStartColor)),
                    Icon(
                      Icons.currency_bitcoin_rounded,
                      color: kContainerStartColor,
                      size: 20,
                    )
                  ],
                ),
                Row(
                  children: const [
                    Text(
                      'Frequency',
                      style: TextStyle(
                          color: kBackgroundEndColor,
                          fontSize: 16,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600),
                    ),
                    Spacer(),
                    Icon(
                      Icons.circle,
                      color: Colors.red,
                      size: 20,
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
