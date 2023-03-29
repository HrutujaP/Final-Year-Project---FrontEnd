import 'package:diskspacerenting/Constants/Constant%20Variables/constants.dart';
import 'package:diskspacerenting/screens/MarketPlaceScreen/components/individualproduct.dart';
import 'package:flutter/material.dart';

class ProductCollections extends StatelessWidget {
  const ProductCollections({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.31,
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
              children: const [
                Text(' < 50 GB Capacity',
                    style: TextStyle(
                      color: kSecondaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    )),
                Spacer(),
                Icon(Icons.sort_rounded, color: kContainerEndColor, size: 28)
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.216,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  children: const [
                    IndividualProduct(),
                    IndividualProduct(),
                    IndividualProduct(),
                    IndividualProduct(),
                    IndividualProduct(),
                    IndividualProduct(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
