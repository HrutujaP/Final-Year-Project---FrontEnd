import 'dart:io';

import 'package:diskspacerenting/Constants/Constant%20Variables/constants.dart';
import 'package:diskspacerenting/Constants/Responsive/responsiveWidget.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class BlockChainVideoLoop extends StatefulWidget {
  const BlockChainVideoLoop({Key? key}) : super(key: key);

  @override
  _BlockChainVideoLoopState createState() => _BlockChainVideoLoopState();
}

class _BlockChainVideoLoopState extends State<BlockChainVideoLoop> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/new3.mp4');
    initializeVideoPlayer();
  }

  Future<void> initializeVideoPlayer() async {
   
    try {
      await _controller.initialize();
    } catch (e) {
      print(e);
      return;
    }

    _controller.setLooping(true);
    if (_controller.value.isInitialized) {
      setState(() {
        _controller.play();
      });
    }
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
            ? FittedBox(
                fit: BoxFit.cover,
                child: SizedBox(
                  height: !ResponsiveWidget.isSmallScreen(context)
                      ? MediaQuery.of(context).size.height * 0.5
                      : MediaQuery.of(context).size.height * 0.3,
                  width: ResponsiveWidget.isSmallScreen(context)
                      ? MediaQuery.of(context).size.width
                      : MediaQuery.of(context).size.width / 2,
                  child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomLeft: const Radius.circular(25),
                        bottomRight: const Radius.circular(25),
                        topRight: ResponsiveWidget.isSmallScreen(context)
                            ? Radius.zero
                            : const Radius.circular(25),
                        topLeft: ResponsiveWidget.isSmallScreen(context)
                            ? Radius.zero
                            : const Radius.circular(25),
                      ),
                      child: ColorFiltered(
                        colorFilter: const ColorFilter.mode(
                            kContainerStartColor, BlendMode.color),
                        child: VideoPlayer(_controller),
                      )

                      // VideoPlayer(_controller),

                      ),
                ),
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
