import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  Database? database;

  Future<Database?> checkDB() async {
    if (database != null) {
      return database;
    } else {
      return await initDB();
    }
  }

  Future<Future<Database>> initDB() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, "todo.db");
    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        String query =
            "CREATE TABLE todotable (id INTEGER PRIMARY KEY AUTOINCREMENT,priority TEXT,todo TEXT)";
        db.execute(query);

      },
    );
  }

  void insertData(
      {required priority,
        required todo}) async {
    database = await checkDB();
    database!.insert("todotable", {
      "todo": todo,
      "priority": priority,
    });
  }

  Future<List<Map>> readData() async {
    database = await checkDB();
    String query = "SELECT * FROM todotable";
    List<Map> list = await database!.rawQuery(query);
    print(list);
    return list;
  }

  Future<List<Map>> filterRead({required priority}) async {
    database = await checkDB();
    var query = "SELECT * FROM todotable WHERE priority=$priority";
    List<Map> l1 = await database!.rawQuery(query);
    return l1;
  }
  Future<void> deleteData({required id})
  async {
    database = await checkDB();
    database!.delete("todotable",where: "id=?",whereArgs: [id]);
  }
  Future<void> updateDatabase(
      {required priority,
        required todo,
        required id,}) async {
    database = await checkDB();
    database!.update(
        'todotable',
        {
          "id":id,
          "todo": todo,
          "priority": priority,
        },
        where: 'id=?',
        whereArgs: [id]);
  }
}