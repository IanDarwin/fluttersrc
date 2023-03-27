import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:provider_sqlite_demo/item.dart';

class DBHelper {
  static const String DB_NAME = 'items.db';
  static const String TABLE_NAME = 'items';
  static const String COLUMN_ID = 'id';
  static const String COLUMN_NAME = 'name';
  static const String COLUMN_DESCRIPTION = 'description';

  Future<Database> _initializeDatabase() async {
    final String path = join(await getDatabasesPath(), DB_NAME);
    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          '''
          CREATE TABLE $TABLE_NAME(
            $COLUMN_ID INTEGER PRIMARY KEY AUTOINCREMENT,
            $COLUMN_NAME TEXT,
            $COLUMN_DESCRIPTION TEXT
          )
          ''',
        );
      },
    );
  }

  Future<int> addItem(Item item) async {
    final Database db = await _initializeDatabase();
    return db.insert(TABLE_NAME, item.toMap());
  }

  Future<List<Item>> getItems() async {
    final Database db = await _initializeDatabase();
    final List<Map<String, dynamic>> maps = await db.query(TABLE_NAME);
    return List.generate(
      maps.length,
      (i) => Item.fromMap(maps[i]),
    );
  }

  Future<int> updateItem(Item item) async {
    final Database db = await _initializeDatabase();
    return db.update(
      TABLE_NAME,
      item.toMap(),
      where: '$COLUMN_ID = ?',
      whereArgs: [item.id],
    );
  }

  Future<int> deleteItem(int id) async {
    final Database db = await _initializeDatabase();
    return db.delete(
      TABLE_NAME,
      where: '$COLUMN_ID = ?',
      whereArgs: [id],
    );
  }
}

