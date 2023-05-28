import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diskspacerenting/Constants/Constant%20Variables/constants.dart';
import 'package:diskspacerenting/Constants/Responsive/responsiveWidget.dart';
import 'package:diskspacerenting/Functions/functions.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:floating_bubbles/floating_bubbles.dart';
import 'package:flutter/material.dart';

class StoredFile extends StatelessWidget {
  final String name;
  final String id;
  final String ext;

  const StoredFile({
    required this.id,
    required this.name,
    required this.ext,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(10),
      elevation: 20,
      shadowColor: kTextLightColor,
      child: GestureDetector(
        onTap: () {
          // download the file
          FirebaseFirestore.instance.collection(id).doc(name).get().then(
            (value) {
              String download_url = value.data()!['url'];
              print(download_url);
              // download the file
            },
          );
        },
        onLongPress: () {
          Functions functions = Functions();
          functions.deletefile(id, name, ext);
          SnackBar snackBar = const SnackBar(
            content: Text(
              'File Deleted',
              style: TextStyle(
                color: kTextDarkColor,
              ),
            ),
            backgroundColor: kContainerEndColor,
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: kContainerEndColor,
              width: 1,
            ),
            // color: kSecondaryColor3,
            color: kContainerEndColor,
            // color: kColor1.withOpacity(0.9),
          ),
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Center(
                    child: Stack(
                      children: [
                        Positioned.fill(
                          top: 20,
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
                            speed: BubbleSpeed.normal, // normal is the default
                          ),
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                name,
                                softWrap: true,
                                style: TextStyle(
                                  fontSize:
                                      ResponsiveWidget.isSmallScreen(context)
                                          ? MediaQuery.of(context).size.width *
                                              0.04
                                          : MediaQuery.of(context).size.width *
                                              0.015,
                                  fontWeight: FontWeight.bold,
                                  color: kTextDarkColor,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.file_open_rounded,
                                color: kTextDarkColor,
                                size: ResponsiveWidget.isSmallScreen(context)
                                    ? MediaQuery.of(context).size.width * 0.1
                                    : MediaQuery.of(context).size.width * 0.05,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
