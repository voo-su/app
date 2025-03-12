import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:voo_su/domain/entities/message.dart';
import 'package:voo_su/presentation/screens/message_screen/widgets/base_message_bubble_widget.dart';
import 'package:voo_su/presentation/screens/message_screen/widgets/full_video_page.dart';

class VideoMessageBubble extends StatefulWidget {
  final Message message;
  final bool isMine;

  const VideoMessageBubble({
    super.key,
    required this.message,
    required this.isMine,
  });

  @override
  State<VideoMessageBubble> createState() => _VideoMessageBubbleState();
}

class _VideoMessageBubbleState extends State<VideoMessageBubble> {
  VideoPlayerController? _controller;
  bool _initialized = false;

  @override
  void initState() {
    super.initState();

    final String? videoUrl = _getMediaUrl(widget.message);

    if (videoUrl != null) {
      _controller =
          VideoPlayerController.network(videoUrl)
            ..addListener(() {
              setState(() {});
            })
            ..initialize()
                .then((_) {
                  _controller?.setVolume(0.0);
                  setState(() => _initialized = true);
                })
                .catchError((error) {
                  debugPrint('Ошибка инициализации видео: $error');
                });
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  void _togglePlayPause() {
    if (_controller == null) return;
    if (_controller!.value.isPlaying) {
      _controller!.pause();
    } else {
      _controller!.play();
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    Widget content;
    if (_controller == null) {
      content = Container(
        width: 200,
        height: 200,
        color: colors.surfaceVariant,
        alignment: Alignment.center,
        child: const Icon(Icons.broken_image, size: 40),
      );
    } else if (!_initialized) {
      content = Container(
        width: 200,
        height: 200,
        color: colors.surfaceVariant,
        alignment: Alignment.center,
        child: CircularProgressIndicator(color: colors.primary),
      );
    } else {
      content = GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => FullVideoPage(videoUrl: _controller!.dataSource),
            ),
          );
        },
        child: AspectRatio(
          aspectRatio: _controller!.value.aspectRatio,
          child: Stack(
            children: [
              VideoPlayer(_controller!),
              Positioned.fill(
                child: GestureDetector(
                  onTap: _togglePlayPause,
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 200),
                    child:
                        _controller!.value.isPlaying
                            ? const SizedBox.shrink()
                            : Container(
                              color: Colors.black54,
                              child: const Icon(
                                Icons.play_arrow,
                                size: 48,
                                color: Colors.white,
                              ),
                            ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    return BaseMessageBubble(
      isMine: widget.isMine,
      message: widget.message,
      messageContent: content,
    );
  }
}

String? _getMediaUrl(Message message) {
  if (message.media is MessageMediaDocument) {
    return (message.media as MessageMediaDocument).file;
  }
  return null;
}
