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
    super.initState();
    _controller = VideoPlayerController.asset('assets/new.mp4')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {
          _controller.setLooping(true);
          _controller.play();
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: MediaQuery.of(context).size.width * 0.61,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 2),
          borderRadius: BorderRadius.circular(25)),
      child: _controller.value.isInitialized
          ? ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: VideoPlayer(_controller),
            )
          : Container(),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
