import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:video_player/video_player.dart';

class loginScreenAnimation extends StatefulWidget {
  const loginScreenAnimation({super.key});

  @override
  State<loginScreenAnimation> createState() => _loginScreenAnimationState();
}

class _loginScreenAnimationState extends State<loginScreenAnimation> {
  late VideoPlayerController _controller;
  @override
  void initState() {
    _controller = VideoPlayerController.asset('assets/loginbubbles.mp4')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {
          _controller.setLooping(true);
          _controller.play();
        });
      });
    super.initState();
  }

  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2.4,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          // border: Border.all(color: Colors.white, width: 2),
          // borderRadius: BorderRadius.circular(25),
          ),
      child: _controller.value.isInitialized
          ? ClipRRect(
              // borderRadius: BorderRadius.circular(25),
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
