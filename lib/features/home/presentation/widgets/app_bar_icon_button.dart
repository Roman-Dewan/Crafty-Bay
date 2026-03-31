import 'package:flutter/material.dart';

class AppBarIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  const AppBarIconButton({super.key, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        radius: 20,
        backgroundColor: Colors.grey[200],
        child: Icon(icon, color: Colors.grey[600]),
      ),
    );
  }
}
