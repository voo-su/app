import 'dart:io';

bool isImageFile(File file) {
  final extensions = ['.jpg', '.png', '.jpeg', '.gif', '.bmp'];
  return extensions.any((ext) => file.path.toLowerCase().endsWith(ext));
}
