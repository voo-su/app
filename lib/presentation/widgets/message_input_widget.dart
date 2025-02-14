import 'package:flutter/material.dart';
import 'package:voo_su/core/theme/colors.dart';

class MessageInputWidget extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final TextInputType keyboardType;
  final int maxLines;

  const MessageInputWidget({
    super.key,
    required this.controller,
    required this.hintText,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: AppColors.lightOnSurface40),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: AppColors.lightSecondarySurface,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      ),
    );
  }
}
