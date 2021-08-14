import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  DatabaseHelper._();

  static final DatabaseHelper db = DatabaseHelper._();

  Database? _database;

  Future<Database> get database async {
    if (_database == null)
      _database = await getDatabaseInstance();
    return _database!;
  }

  Future<Database> getDatabaseInstance() async {
    String _path = await getDatabasesPath();
    String path = join(_path, "travel.db");
    return await openDatabase(path,
        version: 1,
        onCreate: (Database db, int version) async {
          // Create table queries
          db.execute("");
        });
  }

}