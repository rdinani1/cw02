import 'dart:async';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  // 1) Singleton setup
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // 2) Database reference
  static Database? _database;

  // Table + columns
  static const String tableName = 'my_table';
  static const String colId = '_id';
  static const String colName = 'name';
  static const String colAge = 'age';

  // 3) Getter for database (opens it if needed)
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  // 4) Initialize database
  Future<Database> _initDatabase() async {
    final docsDir = await getApplicationDocumentsDirectory();
    final dbPath = join(docsDir.path, 'my_database.db');

    return await openDatabase(
      dbPath,
      version: 1,
      onCreate: _onCreate,
    );
  }

  // 5) Create table
  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $tableName (
        $colId INTEGER PRIMARY KEY AUTOINCREMENT,
        $colName TEXT NOT NULL,
        $colAge INTEGER NOT NULL
      )
    ''');
  }

  // ---------------- CRUD METHODS ----------------

  // Insert
  Future<int> insert(Map<String, dynamic> row) async {
    final db = await database;
    return await db.insert(tableName, row);
  }

  // Query all
  Future<List<Map<String, dynamic>>> queryAllRows() async {
    final db = await database;
    return await db.query(tableName);
  }

  // Update by ID
  Future<int> update(int id, Map<String, dynamic> row) async {
    final db = await database;
    return await db.update(
      tableName,
      row,
      where: '$colId = ?',
      whereArgs: [id],
    );
  }

  // Delete by ID
  Future<int> delete(int id) async {
    final db = await database;
    return await db.delete(
      tableName,
      where: '$colId = ?',
      whereArgs: [id],
    );
  }

  // ---------------- PART 2 CHALLENGE ----------------

  // Query by ID
  Future<Map<String, dynamic>?> queryById(int id) async {
    final db = await database;
    final results = await db.query(
      tableName,
      where: '$colId = ?',
      whereArgs: [id],
      limit: 1,
    );

    if (results.isEmpty) return null;
    return results.first;
  }

  // Delete all records
  Future<int> deleteAll() async {
    final db = await database;
    return await db.delete(tableName); // no WHERE clause = delete everything
  }
}