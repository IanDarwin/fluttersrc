import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_sqlite_demo/items_provider.dart';

import 'db_helper.dart';
import 'items_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    ChangeNotifierProvider<ItemsProvider>(
      child: const MyApp(),
      create: (_) => ItemsProvider())
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of this application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: ItemsPage(),
    );
  }
}
