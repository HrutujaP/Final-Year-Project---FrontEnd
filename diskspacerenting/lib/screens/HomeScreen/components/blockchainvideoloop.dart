// ignore_for_file: library_private_types_in_public_api

import 'package:diskspacerenting/Constants/Constant%20Variables/constants.dart';
import 'package:diskspacerenting/Constants/Responsive/responsiveWidget.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class BlockChainVideoLoop extends StatefulWidget {
  const BlockChainVideoLoop({super.key});

  @override
  _BlockChainVideoLoopState createState() => _BlockChainVideoLoopState();
}

class _BlockChainVideoLoopState extends State<BlockChainVideoLoop> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    _controller = VideoPlayerController.asset('assets/new3.mp4')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {
          _controller.setLooping(true);
          _controller.play();
        });
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(25), bottomRight: Radius.circular(25)),
      elevation: 5,
      child: Container(
        height: !ResponsiveWidget.isSmallScreen(context)
            ? MediaQuery.of(context).size.height * 0.5
            : MediaQuery.of(context).size.height * 0.3,
        width: ResponsiveWidget.isSmallScreen(context)
            ? MediaQuery.of(context).size.width
            : MediaQuery.of(context).size.width / 2,
        decoration: BoxDecoration(
          // border: Border.all(color: Colors.white, width: 2),
          borderRadius: BorderRadius.only(
            bottomLeft: const Radius.circular(25),
            bottomRight: const Radius.circular(25),
            topRight: !ResponsiveWidget.isSmallScreen(context)
                ? const Radius.circular(25)
                : Radius.zero,
            topLeft: !ResponsiveWidget.isSmallScreen(context)
                ? const Radius.circular(25)
                : Radius.zero,
          ),
        ),
        child: _controller.value.isInitialized
            ? ClipRRect(
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25)),
                child: ColorFiltered(
                    colorFilter: const ColorFilter.mode(
                        kContainerStartColor, BlendMode.color),
                    child: VideoPlayer(_controller)),
              )
            : Container(),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
