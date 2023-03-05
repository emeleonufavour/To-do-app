import 'package:flutter/material.dart';

class DialogButton extends StatelessWidget {
  final String name;
  final VoidCallback action;
  const DialogButton({required this.name, required this.action, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: action,
      child: Container(
        height: 40,
        width: 80,
        color: Colors.purple,
        child: Center(
          child: Text(
            name,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
