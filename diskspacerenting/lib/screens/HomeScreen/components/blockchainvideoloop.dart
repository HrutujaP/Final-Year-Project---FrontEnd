// ignore_for_file: library_private_types_in_public_api

import 'package:diskspacerenting/Constants/constants.dart';
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
        height: MediaQuery.of(context).size.height * 0.3,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          // border: Border.all(color: Colors.white, width: 2),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25)),
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
