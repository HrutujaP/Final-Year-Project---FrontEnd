import 'package:diskspacerenting/Constants/Constant%20Variables/constants.dart';
import 'package:diskspacerenting/screens/MyStoragesScreen/components/singledevice.dart';
import 'package:flutter/material.dart';

class MobileOwned extends StatelessWidget {
  List<String> storageIds;
  MobileOwned({
    required this.storageIds,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Owned Storages",
          style: TextStyle(
              color: kContainerMiddleColor,
              fontSize: 23,
              fontWeight: FontWeight.bold),
        ),
        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            physics: const BouncingScrollPhysics(),
            itemCount: storageIds.length,
            itemBuilder: (context, index) {
              var img = index % 4;

              return SingleDeive(
                storageId: storageIds[index],
                img: img.toString(),
              );
            },
          ),
        ),
      ],
    );
  }
}
