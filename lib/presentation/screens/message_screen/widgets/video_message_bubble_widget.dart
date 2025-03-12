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
  late VideoPlayerController? _controller;
  bool _initialized = false;

  @override
  void initState() {
    super.initState();

    const videoUrl =
        'https://file.voo.su/media/files/2025/03/12/0905dd6d-41c9-49cb-a733-6e5299e1d211.MOV';

    _controller =
        VideoPlayerController.network(videoUrl)
          ..addListener(() {
            setState(() {});
          })
          ..initialize()
              .then((_) {
                setState(() {
                  _initialized = true;
                });
              })
              .catchError((error) {
                debugPrint('Ошибка инициализации видео: $error');
              });
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
              builder:
                  (_) => const FullVideoPage(
                    videoUrl:
                        'https://file.voo.su/media/files/2025/03/12/0905dd6d-41c9-49cb-a733-6e5299e1d211.MOV',
                  ),
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
