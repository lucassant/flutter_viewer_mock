import 'dart:async';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

abstract class VideoViewerController {
  void play();
  void pause();
  void seekTo(Duration position);
  StreamController<Duration> get positionStream;
  StreamController<VideoPlayerValue> get valueStream;
  ChewieController get chewieController;
  void dispose();
}
