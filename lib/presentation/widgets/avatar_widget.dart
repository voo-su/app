import 'package:flutter/material.dart';

class AvatarWidget extends StatelessWidget {
  final String avatarUrl;
  final String name;
  final String surname;
  final String username;
  final bool isOnline;
  final double radius;

  const AvatarWidget({
    super.key,
    required this.avatarUrl,
    required this.name,
    required this.surname,
    required this.username,
    this.isOnline = false,
    this.radius = 28,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        CircleAvatar(
          radius: radius,
          backgroundColor: Colors.grey[300],
          backgroundImage:
              avatarUrl.isNotEmpty ? NetworkImage(avatarUrl) : null,
          child:
              avatarUrl.isEmpty
                  ? Text(
                    _getInitials(),
                    style: TextStyle(
                      fontSize: radius / 2,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  )
                  : null,
        ),
        if (isOnline)
          const CircleAvatar(radius: 7, backgroundColor: Colors.red),
      ],
    );
  }

  String _getInitials() {
    if (name.isNotEmpty && surname.isNotEmpty) {
      return "${name[0].toUpperCase()}${surname[0].toUpperCase()}";
    }
    if (name.isNotEmpty) return name[0].toUpperCase();
    if (surname.isNotEmpty) return surname[0].toUpperCase();
    if (username.isNotEmpty) return username[0].toUpperCase();
    return "?";
  }
}
