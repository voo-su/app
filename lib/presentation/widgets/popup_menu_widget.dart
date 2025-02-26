import 'package:flutter/material.dart';

Future<T?> showPopupMenu<T>({
  required BuildContext context,
  required Offset position,
  required List<PopupMenuItem<T>> items,
}) {
  return showMenu<T>(
    context: context,
    position: RelativeRect.fromLTRB(
      position.dx,
      position.dy,
      position.dx + 40,
      position.dy + 40,
    ),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    items: items,
  );
}
