import 'package:diskspacerenting/models/storage.dart';
import 'package:diskspacerenting/screens/RentStorageScreen/components/features.dart';
import 'package:flutter/material.dart';

class AllFeatures extends StatelessWidget {
  Storage storage;
  AllFeatures({
    required this.storage,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.15,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Features(
              icon: Icons.storage,
              parameter: 'Size',
              value: "${storage.size} GB"),
          Features(
              icon: Icons.shield_outlined,
              parameter: 'Durability',
              value: 'SHA, MD5'),
          Features(
              icon: Icons.access_time,
              parameter: 'Access',
              value: storage.duration),
          Features(
              icon: Icons.sync, parameter: 'Congruity', value: 'All Devices'),
        ],
      ),
    );
  }
}
