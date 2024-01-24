import 'dart:async';

import 'package:chewie/src/chewie_player.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:video_viewer/data/video_viewer_controller.dart';

class VideoViewerControllerImpl implements VideoViewerController {
  final ChewieController _chewieController;

  VideoViewerControllerImpl(
    String videoUrl, {
    bool autoPlay = true,
    bool looping = false,
    double aspectRatio = 16 / 9,
    bool showControls = true,
    bool showOptions = true,
    bool allowFullScreen = true,
    bool allowMuting = true,
    Widget? customControls,
  }) : _chewieController = ChewieController(
          videoPlayerController: VideoPlayerController.networkUrl(
            Uri.parse(
              videoUrl,
            ),
          ),
          autoPlay: autoPlay,
          looping: looping,
          aspectRatio: aspectRatio,
          showControls: showControls,
          showOptions: showOptions,
          autoInitialize: true,
          allowFullScreen: allowFullScreen,
          allowMuting: allowMuting,
          customControls: customControls,
          placeholder: Container(
            color: Colors.black,
          ),
        ) {
    _initialize();
  }

  void _initialize() {
    _chewieController.videoPlayerController.addListener(() {
      positionStream.add(
        _chewieController.videoPlayerController.value.position,
      );
      valueStream.add(
        _chewieController.videoPlayerController.value,
      );
    });
  }

  @override
  ChewieController get chewieController => _chewieController;

  @override
  void dispose() {
    _chewieController.videoPlayerController.dispose();
    _chewieController.dispose();
    positionStream.close();
    valueStream.close();
  }

  @override
  void pause() {
    _chewieController.pause();
  }

  @override
  void play() {
    _chewieController.play();
  }

  @override
  StreamController<Duration> get positionStream =>
      StreamController<Duration>.broadcast();

  @override
  void seekTo(Duration position) {
    _chewieController.videoPlayerController.seekTo(position);
  }

  @override
  StreamController<VideoPlayerValue> get valueStream =>
      StreamController<VideoPlayerValue>.broadcast();
}
