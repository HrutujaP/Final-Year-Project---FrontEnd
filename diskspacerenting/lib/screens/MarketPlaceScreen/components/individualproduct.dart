import 'dart:math';

import 'package:diskspacerenting/Constants/Constant%20Variables/constants.dart';
import 'package:diskspacerenting/Constants/Responsive/responsiveWidget.dart';
import 'package:diskspacerenting/models/account.dart';
import 'package:diskspacerenting/models/storage.dart';
import 'package:diskspacerenting/screens/RentStorageScreen/rentstoragescreen.dart';
import 'package:flutter/material.dart';

class IndividualProduct extends StatefulWidget {
  Account account;
  Storage storage;
  IndividualProduct({
    required this.account,
    required this.storage,
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
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => RentStorageScreen(
                        storage: widget.storage,
                        account: widget.account,
                      )));
        },
        child: Container(
          height: ResponsiveWidget.isSmallScreen(context)
              ? MediaQuery.of(context).size.height * 0.216
              : MediaQuery.of(context).size.height * 0.3,
          width: ResponsiveWidget.isSmallScreen(context)
              ? MediaQuery.of(context).size.width * 0.35
              : MediaQuery.of(context).size.width * 0.15,
          decoration: BoxDecoration(
            color: kContainerEndColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const Spacer(),
                Icon(Icons.storage_outlined,
                    color: generateRandomColor(), size: 85),
                const Spacer(),
                Row(
                  children: [
                    const Text(
                      'Size',
                      style: TextStyle(
                          color: kBackgroundEndColor,
                          fontSize: 16,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600),
                    ),
                    const Spacer(),
                    Text(
                      '${widget.storage.size} GB',
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          color: kContainerStartColor),
                    )
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      'Price',
                      style: TextStyle(
                          color: kBackgroundEndColor,
                          fontSize: 16,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600),
                    ),
                    const Spacer(),
                    Text(widget.storage.price,
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                            color: kContainerStartColor)),
                    const Icon(
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
                ),
                const Spacer()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
