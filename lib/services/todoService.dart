import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/adapters.dart';

class ToDoService extends ChangeNotifier {
  List<Map<String, dynamic>> _items = [];
  final myBox = Hive.box('myBox');
  get items => _items;

  set items(value) {
    _items = value;
    notifyListeners();
  }

  void refreshItems() {
    //gets all the items inside myBox
    final data = myBox.keys.map((e) {
      //gets a single item
      final item = myBox.get(e);
      //returns a map of each item
      return {'key': e, 'name': item["name"], "quantity": item["quantity"]};
    }).toList();

    //initialises items to the item gotten from box
    _items = data.reversed.toList();
    notifyListeners();
    print("length of items in list is ${_items.length}");
  }
}
