import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ToDoHead extends StatelessWidget {
  const ToDoHead({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.purple[300],
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      ),
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          'To Do',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
