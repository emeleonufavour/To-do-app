import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:hive/hive.dart';

import 'dialogButton.dart';

class DialogBox extends StatefulWidget {
  //final List<Map<String, dynamic>> items;
  VoidCallback refresh;
  //final Function(Map<String, dynamic> newItem) createItem;
  DialogBox({required this.refresh, super.key});

  @override
  State<DialogBox> createState() => _DialogBoxState();
}

class _DialogBoxState extends State<DialogBox> {
  TextEditingController _textEditingController = TextEditingController();

  final myBox = Hive.box('myBox');

  Future<void> _createItem(Map<String, dynamic> newItem) async {
    await myBox.add(newItem);
    widget.refresh();
    print('amount of data in box is ${myBox.length} ');
  }

  @override
  void dispose() {
    _textEditingController.dispose();

    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.purple[50],
      content: Container(
        height: 120,
        child: Column(
          children: [
            //text field to write name of task
            Container(
              padding: EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                  color: Colors.purple[100],
                  borderRadius: BorderRadius.circular(1)),
              child: TextField(
                controller: _textEditingController,
                decoration: const InputDecoration(
                    hintStyle: TextStyle(color: Colors.white),
                    hintText: "Name of task",
                    border: InputBorder.none),
              ),
            ),
            SizedBox(
              height: 30,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DialogButton(
                    name: 'Cancel',
                    action: () {
                      Navigator.of(context).pop();
                    }),
                DialogButton(
                    name: 'Add',
                    action: () {
                      _createItem({
                        "name": _textEditingController.text,
                        "complete": false
                      });
                      Navigator.of(context).pop();
                    })
              ],
            )
          ],
        ),
      ),
    );
  }
}
