import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_tutorial/screens/empty.dart';
import 'package:hive_tutorial/services/todoService.dart';
import 'package:hive_tutorial/widget/dialogbox.dart';
import 'package:hive_tutorial/widget/heading.dart';
import 'package:hive_tutorial/widget/profile.dart';
import 'package:hive_tutorial/widget/toDoTile.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Map<String, dynamic>> _items = [];
  final myBox = Hive.box('myBox');

  @override
  void initState() {
    _refreshItems();
    // TODO: implement initState
    super.initState();
  }

  void checkBoxChange(List<Map<String, dynamic>> list, bool? value, int index) {
    setState(() {
      list[index]['complete'] = !list[index]['complete'];
    });
  }

  void _refreshItems() {
    //gets all the items inside myBox
    final data = myBox.keys.map((e) {
      //gets a single item
      final item = myBox.get(e);
      //returns a map of each item
      return {
        'key': e,
        'name': item["name"],
        "complete": item["complete"] as bool
      };
    }).toList();

    //initialises items to the item gotten from box
    setState(() {
      _items = data.reversed.toList();
    });

    print("length of items in list is ${_items.length}");
  }

  Future<void> deleteTask(int itemKey) async {
    await myBox.delete(itemKey);
    _refreshItems();
  }

  void createNewTask() {
    print(_items.length);
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            refresh: _refreshItems,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //profile head
          ProfileHead(),
          Expanded(
            child: Stack(children: [
              //to do heading
              //ToDoHead(),
              //to do list
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: MediaQuery.of(context).size.height * (4.5 / 7),
                  decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 20),
                    child: _items.isEmpty
                        ? EmptyListPage()
                        : ListView.builder(
                            itemCount: _items.length,
                            itemBuilder: ((context, i) {
                              final currentItem = _items[i];
                              return ToDoTile(
                                  taskName: currentItem['name'],
                                  taskCompleted: currentItem['complete'],
                                  onChanged: (p0) =>
                                      checkBoxChange(_items, p0, i),
                                  deleteBox: (BuildContext context) =>
                                      deleteTask(currentItem['key']));
                            })),
                  ),
                ),
              ),
            ]),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
