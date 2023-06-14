import 'package:diskspacerenting/Constants/Constant%20Variables/constants.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class ImageScreen extends StatefulWidget {
  final String url;

  const ImageScreen({Key? key, required this.url}) : super(key: key);

  @override
  State<ImageScreen> createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  @override
  Widget build(BuildContext context) {
    print(widget.url);
    return SafeArea(
      child: Scaffold(
          body: Container(
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
        child: Stack(children: [
          Center(
              child: FadeInImage.memoryNetwork(
            placeholder: kTransparentImage,
            image: widget.url,
          )),
          Positioned(
            top: 0,
            left: 0,
            child: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: kBackgroundEndColor,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ]),
      )),
    );
  }
}
