import 'dart:io';

import 'package:diskspacerenting/Constants/Constant%20Variables/constants.dart';
import 'package:diskspacerenting/Constants/Responsive/responsiveWidget.dart';
import 'package:diskspacerenting/Functions/functions.dart';
import 'package:diskspacerenting/screens/file%20openers/imageScreen.dart';
import 'package:diskspacerenting/screens/file%20openers/pdfScreen.dart';
import 'package:file_picker/file_picker.dart';

import 'package:firedart/firedart.dart';

import 'package:http/http.dart' as http;
import 'package:floating_bubbles/floating_bubbles.dart';
import 'package:flutter/material.dart';

class StoredFile extends StatefulWidget {
  final String name;
  final String id;

  const StoredFile({
    required this.id,
    required this.name,
    super.key,
  });

  @override
  State<StoredFile> createState() => _StoredFileState();
}

class _StoredFileState extends State<StoredFile> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUrl(widget.id, widget.name);
  }

  String url = "";

  Future<String> pickDirectory() async {
    String? directory;

    try {
      directory = await FilePicker.platform.getDirectoryPath();
    } catch (e) {
      print('Error picking directory: $e');
    }

    if (directory != null) {
      return directory;
    } else {
      return "";
    }
  }

  Future<void> openFile(String furl) async {
    try {
      var url = Uri.parse(furl); // Replace with your file URL
      var response = await http.get(url);

      if (response.statusCode == 200) {
        String path = await pickDirectory();
        path = path.replaceAll("\\", "/");
        var file =
            File("$path/${widget.name}"); // Replace with your desired file path
        file.create();
        await file.writeAsBytes(response.bodyBytes);
        // file.writeAsBytesSync(response.bodyBytes);
        // Do something with the file, e.g., open it
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.transparent,
          content: Text(
            "File saved to path: $path",
            style: const TextStyle(
              color: kTextColor,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          duration: const Duration(seconds: 3),
        ));
      } else {
        print('Failed to download file. Error: ${response.statusCode}');
      }
    } catch (e) {
      print(e);
    }
  }

  void getUrl(String id, String name) async {
    Document doc = await Firestore.instance.collection(id).document(name).get();

    setState(() {
      url = doc.map["downloadUrl"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(10),
      elevation: 20,
      shadowColor: kTextLightColor,
      child: GestureDetector(
        onTap: () {
          // download the file
          //  openFile(url);

          if (widget.name.contains(".pdf")) {
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (context) => PDFScreen(
            //               path: url,
            //             )));
          } else {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ImageScreen(
                          url: url,
                        )));
          }
        },
        onLongPress: () {
          Functions functions = Functions();
          functions.deletefile(widget.id, widget.name);
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
                              child: Text(widget.name.length>30?
                                widget.name.substring(0, 30):widget.name,
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
