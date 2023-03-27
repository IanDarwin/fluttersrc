import 'package:flutter/material.dart';

import 'db_helper.dart';
import 'item.dart';

class ItemsProvider extends ChangeNotifier {
  List<Item> _items = [];

  ItemsProvider() {
    init();
  }

  init() async {
    await loadItems();
  }

  List<Item> get items => _items;

  DBHelper helper = DBHelper();

  Future<void> addItem(Item item) async {
    final id = await helper.addItem(item);
    final newItem = Item(id: id, name: item.name, description: item.description);
    _items.add(newItem);
    notifyListeners();
  }

  Future<void> updateItem(Item item) async {
    await helper.updateItem(item);
    final index = _items.indexWhere((i) => i.id == item.id);
    _items[index] = item;
    notifyListeners();
  }

  Future<void> deleteItem(int id) async {
    await helper.deleteItem(id);
    _items.removeWhere((i) => i.id == id);
    notifyListeners();
  }

  Future<void> loadItems() async {
    _items = await helper.getItems();
    notifyListeners();
  }
}

