import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_viewer/data/video_viewer_controller.dart';
import 'package:video_viewer/data/video_viewer_controller_impl.dart';

class MeuVideoThumbnailWidget extends StatefulWidget {
  final Function()? onVideoTap;
  const MeuVideoThumbnailWidget({
    super.key,
    required this.onVideoTap,
  });

  @override
  State<MeuVideoThumbnailWidget> createState() =>
      _MeuVideoThumbnailWidgetState();
}

class _MeuVideoThumbnailWidgetState extends State<MeuVideoThumbnailWidget> {
  late VideoViewerController _meuVideoController;

  @override
  void initState() {
    super.initState();

    _meuVideoController = VideoViewerControllerImpl(
      'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
      autoPlay: false,
      looping: false,
      showControls: true,
      showOptions: false,
      allowFullScreen: false,
      allowMuting: false,
      customControls: _customControls(),
    );
  }

  Widget _customControls() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: Icon(
              Icons.play_arrow,
              size: 50,
              color: Colors.red,
            ),
            onPressed: widget.onVideoTap,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: Chewie(
        controller: _meuVideoController.chewieController,
      ),
    );
  }
}
