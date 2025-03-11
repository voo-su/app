import 'package:flutter/material.dart';
import 'package:voo_su/domain/entities/message.dart';
import 'package:voice_message_package/voice_message_package.dart';
import 'package:voo_su/presentation/screens/message_screen/widgets/message_status_widget.dart';

class AudioMessageBubble extends StatelessWidget {
  final bool isMine;
  final Message message;
  final String audioUrl;

  const AudioMessageBubble({
    super.key,
    required this.isMine,
    required this.message,
    required this.audioUrl,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Align(
      alignment: isMine ? Alignment.centerRight : Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.75,
            ),
            decoration: BoxDecoration(
              color: isMine ? colors.primary : colors.surfaceVariant,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                VoiceMessageView(
                  circlesColor: colors.inversePrimary,
                  activeSliderColor: colors.inversePrimary,
                  counterTextStyle: TextStyle(
                    color: colors.inversePrimary,
                    fontSize: 12,
                  ),
                  innerPadding: 6,
                  controller: VoiceController(
                    audioSrc: audioUrl,
                    maxDuration: const Duration(seconds: 30),
                    isFile: false,
                    onComplete: () {},
                    onPause: () {},
                    onPlaying: () {},
                    onError:
                        (err) =>
                            debugPrint("Ошибка воспроизведения аудио: $err"),
                  ),
                ),
                const SizedBox(height: 4),
                MessageStatusWidget(message: message, isMine: isMine),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
