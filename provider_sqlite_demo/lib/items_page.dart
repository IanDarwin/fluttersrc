import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_sqlite_demo/items_provider.dart';
import 'package:provider_sqlite_demo/item.dart';

class ItemsPage extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  ItemsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Items'),
      ),
      body: Consumer<ItemsProvider>(
        builder: (context, provider, child) {
          return ListView.builder(
            itemCount: provider.items.length,
            itemBuilder: (context, index) {
              Item item = provider.items[index];
              return ListTile(
                title: Text(item.name),
                subtitle: Text(item.description),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    provider.deleteItem(item.id!);
                  },
                ),
                onTap: () {
                  _showEditDialog(context, provider, item);
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          _showAddDialog(context);
        },
      ),
    );
  }

  void _showAddDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add Item'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _nameController,
                decoration: InputDecoration(hintText: 'Name'),
              ),
              TextField(
                controller: _descriptionController,
                decoration: InputDecoration(hintText: 'Description'),
              ),
            ],
          ),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                _nameController.clear();
                _descriptionController.clear();
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Save'),
              onPressed: () {
                Item item = Item(
                  name: _nameController.text,
                  description: _descriptionController.text,
                );
                Provider.of<ItemsProvider>(context, listen: false).addItem(item);
                _nameController.clear();
                _descriptionController.clear();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showEditDialog(BuildContext context, ItemsProvider provider, Item item) {
    TextEditingController nameController = TextEditingController(text: item.name);
    TextEditingController descriptionController = TextEditingController(text: item.description);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit Item'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(hintText: 'Name'),
              ),
              TextField(
                controller: descriptionController,
                decoration: InputDecoration(hintText: 'Description'),
              ),
            ],
          ),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Save'),
              onPressed: () {
                Item newItem = item.copyWith(
                  name: nameController.text,
                  description: descriptionController.text,
                );
                provider.updateItem(newItem);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

