import 'package:flutter/material.dart';

class ApplicationIcon extends StatelessWidget {
  final IconData icon;
  final color;
  final VoidCallback? onTap;

  const ApplicationIcon(this.icon, {required this.color, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Icon(
        icon,
        color: color,
      ),
      onTap: onTap,
    );
  }
}
