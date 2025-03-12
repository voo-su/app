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

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return '$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    final videoValue = _controller.value;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child:
                  _initialized
                      ? AspectRatio(
                        aspectRatio: videoValue.aspectRatio,
                        child: VideoPlayer(_controller),
                      )
                      : const CircularProgressIndicator(),
            ),
            Positioned(
              top: 8,
              left: 8,
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 28,
                ),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
            if (_initialized)
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  color: Colors.black54,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 8,
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        icon: Icon(
                          videoValue.isPlaying ? Icons.pause : Icons.play_arrow,
                          color: Colors.white,
                        ),
                        onPressed: _togglePlayPause,
                      ),
                      Text(
                        _formatDuration(videoValue.position),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(width: 6),
                      Expanded(
                        child: Slider(
                          activeColor: Colors.red,
                          inactiveColor: Colors.white60,
                          min: 0,
                          max: videoValue.duration.inSeconds.toDouble(),
                          value:
                              videoValue.position.inSeconds
                                  .clamp(0, videoValue.duration.inSeconds)
                                  .toDouble(),
                          onChanged: (value) {
                            final position = Duration(seconds: value.toInt());
                            _controller.seekTo(position);
                          },
                        ),
                      ),
                      Text(
                        _formatDuration(videoValue.duration),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(width: 8),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
