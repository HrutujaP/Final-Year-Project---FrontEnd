// ignore_for_file: library_private_types_in_public_api

import 'dart:io';
import 'package:diskspacerenting/Constants/Constant%20Variables/constants.dart';
import 'package:diskspacerenting/Constants/Responsive/responsiveWidget.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:video_player_win/video_player_win.dart';

class BlockChainVideoLoop extends StatefulWidget {
  const BlockChainVideoLoop({super.key});

  @override
  _BlockChainVideoLoopState createState() => _BlockChainVideoLoopState();
}

class _BlockChainVideoLoopState extends State<BlockChainVideoLoop> {
  late var _controller;

  @override
  void initState() {
    if (Platform.isWindows) {
      _controller = WinVideoPlayerController.file(File('assets/new3.mp4'))
        ..initialize().then((_) {
          // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
          setState(() {
            _controller.setLooping(true);
            _controller.play();
          });
        });
    } else {
      _controller = VideoPlayerController.asset('assets/new3.mp4')
        ..initialize().then((_) {
          // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
          setState(() {
            _controller.setLooping(true);
            _controller.play();
          });
        });
    }

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
                        child: Video(controller: _controller)),
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

class Video extends StatelessWidget {
  const Video({
    super.key,
    required controller,
  }) : _controller = controller;

  final _controller;

  @override
  Widget build(BuildContext context) {
    if (Platform.isWindows) {
      return FittedBox(
        fit: BoxFit.cover,
        child: SizedBox(
          width: _controller.value.size.width,
          height: _controller.value.size.height,
          child: AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: WinVideoPlayer(_controller)),
        ),
      );
    } else {
      return VideoPlayer(_controller);
    }
  }
}
