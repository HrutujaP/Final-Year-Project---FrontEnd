import 'dart:ffi';

import 'package:diskspacerenting/Constants/Constant%20Variables/constants.dart';
import 'package:diskspacerenting/Constants/Responsive/responsiveWidget.dart';
import 'package:diskspacerenting/Functions/functions.dart';
import 'package:diskspacerenting/screens/MarketPlaceScreen/components/individualproduct.dart';
import 'package:flutter/material.dart';

class ProductCollections extends StatefulWidget {
  String limit;
  ProductCollections({
    required this.limit,
    Key? key,
  }) : super(key: key);

  @override
  State<ProductCollections> createState() => _ProductCollectionsState();
}

class _ProductCollectionsState extends State<ProductCollections> {
  Functions functions = Functions();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ResponsiveWidget.isSmallScreen(context)
          ? MediaQuery.of(context).size.height * 0.31
          : MediaQuery.of(context).size.height * 0.35,
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            kContainerStartColor.withOpacity(0.5),
            kContainerMiddleColor.withOpacity(0.5),
            kContainerEndColor.withOpacity(0.5),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(' < ${widget.limit} GB Capacity',
                    style: const TextStyle(
                      color: kSecondaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    )),
                const Spacer(),
                const Icon(Icons.sort_rounded,
                    color: kContainerEndColor, size: 28)
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: FutureBuilder(
                future: functions.getStorages(int.parse(widget.limit)),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: ResponsiveWidget.isSmallScreen(context)
                          ? MediaQuery.of(context).size.height * 0.216
                          : MediaQuery.of(context).size.height * 0.25,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return IndividualProduct();
                        },
                      ),
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
