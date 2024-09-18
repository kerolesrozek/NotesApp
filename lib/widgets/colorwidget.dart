import 'package:flutter/material.dart';

class ColorWidget extends StatelessWidget {
  const ColorWidget({
    super.key,
    required this.isactive, required this.color,
  });
  final bool isactive;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return isactive == true
        ? Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: CircleAvatar(
              radius: 33,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 30,
                backgroundColor: color,
              ),
            ),
          )
        : Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: CircleAvatar(
              radius: 30,
              backgroundColor: color,
            ),
          );
  }
}
