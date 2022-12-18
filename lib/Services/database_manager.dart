import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseManager {
  

  
  Future _copyDatabase() async {
  // Get the directory where the database should be saved
  var databasesPath = await getDatabasesPath();
  var path = join(databasesPath, "dictionary.db");

  // Check if the database already exists
  bool exists = await databaseExists(path);

  if (!exists) {
    // If the database does not exist, copy it from the assets directory
    ByteData data = await rootBundle.load(join("assets", "dictionary.db"));
    List<int> bytes =
        data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    await File(path).writeAsBytes(bytes);
  }

  Database database = await openDatabase(path, version: 1, onCreate: ((db, version) async {
    await db.query(
      ''
    );
  }));
}
}