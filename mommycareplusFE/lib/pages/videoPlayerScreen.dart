import 'package:flutter/material.dart';

class VideoPlayerScreen extends StatelessWidget {
  final String videoUrl;

  const VideoPlayerScreen({super.key, required this.videoUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Playing Video")),
      body: Center(child: Text("Playing video from URL: $videoUrl")),
    );
  }
}
