import "dart:developer";

import "package:flutter/material.dart";
import "package:flutter/widgets.dart";
import "package:path/path.dart";
import "package:sqflite/sqflite.dart";
import "package:todoadvancelevel_app/Modal.dart";
import "./TODO.dart";

Database? database;

Future<void> insertData(Todo obj1) async {
  try {
    Database? localDb = database;
    await localDb!.insert(
      "Mytable",
      obj1.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  } catch (e) {
    print('Error inserting data: $e');
  }
}

// Future<List<Todo>> getData() async {
//   try {
//     Database? localDb = database;
//     final List<Map<String, dynamic>> fetchedData =
//         await localDb!.query("Mytable");
//     print("$fetchedData");

//     // Convert fetched data to a list of Todo objects
//     return fetchedData.map<Todo>((map) => Todo.fromMap(map)).toList();
//   } catch (e) {
//     print('Error fetching data: $e');
//     return [];
//   }
// }
List<Map<String, dynamic>> allData = [];
Future<List<Map<String, dynamic>>> getData() async {
  Database? localDB = await database;

  List<Map<String, dynamic>> fetchedData = await localDB!.query("Mytable");
  allData.clear();
  allData = fetchedData;

  print("Fetcheddata: $fetchedData");

  return fetchedData;
}

void updateData(Todo updateObject) async {
  try {
    Database? localDb = await database;
    int rowsUpdated = await localDb!.update(
      "Mytable",
      updateObject.toMap(),
      where: "name = ?",
      whereArgs: [updateObject.name],
    );
    if (rowsUpdated > 0) {
      log("Successfully updated ${rowsUpdated} row(s)");
    } else {
      log("No rows updated. Ensure the name exists in the database.");
    }
  } catch (e) {
    log("Error during update: $e");
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  database = await openDatabase(
    join(await getDatabasesPath(), "ADVANCED TODO.db"),
    version: 1,
    onCreate: (db, version) {
      db.execute('''create table Mytable(
    name TEXT PRIMARY KEY,
    description TEXT,
    date TEXT)''');
    },
  );

  runApp(const MyApp());

  await getData();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyToDoApp(),
    );
  }
}
