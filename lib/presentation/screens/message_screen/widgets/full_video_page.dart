import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class FullVideoPage extends StatefulWidget {
  final String videoUrl;

  const FullVideoPage({Key? key, required this.videoUrl}) : super(key: key);

  @override
  State<FullVideoPage> createState() => _FullVideoPageState();
}

class _FullVideoPageState extends State<FullVideoPage> {
  late VideoPlayerController _controller;
  bool _initialized = false;

  @override
  void initState() {
    super.initState();
    _controller =
        VideoPlayerController.network(widget.videoUrl)
          ..addListener(() {
            setState(() {});
          })
          ..initialize()
              .then((_) {
                setState(() {
                  _initialized = true;
                  _controller.play();
                });
              })
              .catchError((error) {
                debugPrint(
                  'Ошибка инициализации видео в FullVideoPage: $error',
                );
              });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _togglePlayPause() {
    if (_controller.value.isPlaying) {
      _controller.pause();
    } else {
      _controller.play();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Center(
            child:
                _initialized
                    ? AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: Stack(
                        children: [
                          VideoPlayer(_controller),
                          Positioned.fill(
                            child: GestureDetector(
                              onTap: _togglePlayPause,
                              child: AnimatedSwitcher(
                                duration: const Duration(milliseconds: 200),
                                child:
                                    _controller.value.isPlaying
                                        ? const SizedBox.shrink()
                                        : Container(
                                          color: Colors.black54,
                                          child: const Icon(
                                            Icons.play_arrow,
                                            size: 64,
                                            color: Colors.white,
                                          ),
                                        ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                    : const Center(child: CircularProgressIndicator()),
          ),
          Positioned(
            top: 40,
            left: 5,
            child: IconButton(
              icon: const Icon(Icons.close, color: Colors.white, size: 30),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
        ],
      ),
    );
  }
}
