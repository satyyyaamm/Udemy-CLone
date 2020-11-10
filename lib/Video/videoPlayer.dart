import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayer extends StatefulWidget {
  final VideoPlayerController videoPlayerController;
  final bool isloop;

  const VideoPlayer({Key key, this.videoPlayerController, this.isloop})
      : super(key: key);
  @override
  _VideoPlayerState createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  ChewieController chewieController;

  @override
  void initState() {
    chewieController = ChewieController(
        autoPlay: true,
        videoPlayerController: widget.videoPlayerController,
        looping: widget.isloop,
        autoInitialize: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Chewie(
      controller: chewieController,
    );
  }
}

class VideoDisplay extends StatefulWidget {
  final String videoUrl;

  const VideoDisplay({Key key, this.videoUrl}) : super(key: key);
  @override
  _VideoDisplayState createState() => _VideoDisplayState();
}

class _VideoDisplayState extends State<VideoDisplay> {
  @override
  Widget build(BuildContext context) {
    return VideoPlayer(
      videoPlayerController: VideoPlayerController.network(widget.videoUrl),
    );
  }
}
