import 'package:flutter/material.dart';

class FullPhotoPage extends StatelessWidget {
  final String photoUrl;

  const FullPhotoPage({super.key, required this.photoUrl});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Center(
            child: Hero(
              tag: photoUrl,
              child: InteractiveViewer(
                minScale: 0.5,
                maxScale: 4.0,
                child: Image.network(photoUrl),
              ),
            ),
          ),
          Positioned(
            top: 40,
            left: 5,
            child: IconButton(
              icon: Icon(Icons.arrow_back, color: colors.onSurface),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
        ],
      ),
    );
  }
}
