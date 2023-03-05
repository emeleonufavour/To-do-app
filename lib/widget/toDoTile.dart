import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {
  final String taskName;
  final taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteBox;
  ToDoTile(
      {required this.taskName,
      required this.taskCompleted,
      required this.onChanged,
      required this.deleteBox,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          //side color
          Container(
            height: 70,
            width: 5,
            decoration: BoxDecoration(
                color: Colors.purple[200],
                borderRadius: BorderRadius.circular(10)),
          ),
          //fading container
          Slidable(
            endActionPane: ActionPane(motion: BehindMotion(), children: [
              SlidableAction(
                borderRadius: BorderRadius.circular(10),
                onPressed: deleteBox,
                icon: Icons.delete_rounded,
                backgroundColor: Colors.red,
              ),
            ]),
            child: Container(
              height: 70,
              width: 340,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  gradient: LinearGradient(
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft,
                    colors: [
                      Colors.purple[100] as Color,
                      Colors.grey[100] as Color,
                    ],
                  )),
              child: Row(
                children: [
                  Checkbox(
                      activeColor: Colors.purple[300],
                      shape: CircleBorder(),
                      checkColor: Colors.white,
                      value: taskCompleted,
                      onChanged: onChanged),
                  Text(
                    taskName,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        decoration:
                            taskCompleted ? TextDecoration.lineThrough : null,
                        color: taskCompleted ? Colors.red : Colors.black),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
