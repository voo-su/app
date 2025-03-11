import 'package:flutter/material.dart';
import 'package:voo_su/domain/entities/message.dart';
import 'package:voo_su/presentation/screens/message_screen/widgets/base_message_bubble_widget.dart';

//"https://file.voo.su/media/images/2025/03/03/de0275e9-e221-4a79-b889-711d9fbe3f75_450x458.png"

class PhotoMessageBubble extends StatelessWidget {
  final Message message;
  final bool isMine;

  const PhotoMessageBubble({
    super.key,
    required this.message,
    required this.isMine,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final String photoUrl =
        "https://file.voo.su/media/images/2025/03/03/de0275e9-e221-4a79-b889-711d9fbe3f75_450x458.png";

    return BaseMessageBubble(
      isMine: isMine,
      message: message,
      messageContent: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.network(
          photoUrl,
          fit: BoxFit.cover,
          width: 200,
          height: 200,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return Container(
              width: 200,
              height: 200,
              color: colors.surfaceVariant,
              child: Center(
                child: CircularProgressIndicator(color: colors.primary),
              ),
            );
          },
          errorBuilder: (context, error, stackTrace) {
            return Container(
              width: 200,
              height: 200,
              color: colors.surfaceVariant,
              child: const Icon(Icons.image_not_supported, size: 40),
            );
          },
        ),
      ),
    );
  }
}
