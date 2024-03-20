import 'package:flutter/material.dart';
import 'package:video_viewer/data/adapters/video_handler_controller.dart';
import 'package:video_viewer_export/video_viewer_export.dart';

class ChewieControllerImpl extends VideoHandlerController {
  ChewieControllerImpl({
    required this.chewieController,
  });

  final ChewieController chewieController;

  @override
  void dispose() {
    chewieController.dispose();
  }

  @override
  void pause() {
    chewieController.pause();
  }

  @override
  void play() {
    chewieController.play();
  }

  @override
  Future<void> seekTo(Duration position) async {
    await chewieController.videoPlayerController.seekTo(position);
  }

  @override
  Widget get videoPlayerWidget => Chewie(controller: chewieController);
}
