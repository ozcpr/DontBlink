import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';


class videoTemplate extends StatelessWidget {

  String videoName = 'start_recursive.mp4';
  final aspectRatio;



  videoTemplate({required this.videoName, required this.aspectRatio});

  Future<ChewieController> getChewie() async {
    VideoPlayerController vidPlayer = VideoPlayerController.asset('lib/assets/video/${videoName}');
    await vidPlayer.initialize();
    print("videoPlayer initialized #########################################");

    ChewieController chew = ChewieController(
      videoPlayerController: vidPlayer,
      autoPlay: true,
      looping: true,
      aspectRatio: aspectRatio,
      showControls: false,
      allowFullScreen: true,
    );
    return chew;
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

