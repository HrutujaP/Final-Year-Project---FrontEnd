// ignore_for_file: library_private_types_in_public_api

// import 'dart:io';
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
  late VideoPlayerController _controller;
  Future<void> initializeVideoPlayer() async {
    try {
      // Wait for controller to initialize before performing any action
      await _controller.initialize();
    } catch (e) {
      print(e);
      return;
    }

    // Set state variables from within UI thread
    setState(() {
      print("Hellow");
      _controller.setLooping(true);
      _controller.play();
    });
  }

  @override
  void initState() {
    _controller = VideoPlayerController.asset('assets/new3.mp4');
    initializeVideoPlayer();

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
    // return Video(controller: _controller);
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
    required this.controller,
  });

  final VideoPlayerController controller;

  @override
  Widget build(BuildContext context) {
    return VideoPlayer(controller);
  }
}
