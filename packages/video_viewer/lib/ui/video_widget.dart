import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_viewer/data/video_viewer_controller.dart';

class MeuVideoWidget extends StatefulWidget {
  final VideoViewerController meuVideoController;
  const MeuVideoWidget({
    super.key,
    required this.meuVideoController,
  });

  @override
  State<MeuVideoWidget> createState() => _MeuVideoWidgetState();
}

class _MeuVideoWidgetState extends State<MeuVideoWidget> {
  @override
  void dispose() {
    widget.meuVideoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: Chewie(
        controller: widget.meuVideoController.chewieController,
      ),
    );
  }
}
