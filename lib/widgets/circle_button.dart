import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  final IconData icon;
  final void Function() onPressed;

  const CircleButton({super.key, required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      //margin: const EdgeInsets.all(4.0),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: Icon(icon),
        iconSize: 30.0,
        color: Colors.black.withAlpha(400),
        onPressed: onPressed,
      ),
    );
  }
}
