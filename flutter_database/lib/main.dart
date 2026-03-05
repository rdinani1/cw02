import 'package:flutter/material.dart';
import 'database_helper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter SQLite Demo',
      theme: ThemeData(useMaterial3: true),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final dbHelper = DatabaseHelper.instance;

  @override
  void initState() {
    super.initState();
    // This forces database creation early (optional but helpful)
    dbHelper.database;
  }

  Future<void> _insert() async {
    final id = await dbHelper.insert({
      DatabaseHelper.colName: 'Bob',
      DatabaseHelper.colAge: 23,
    });
    print('Inserted row id: $id');
  }

  Future<void> _queryAll() async {
    final rows = await dbHelper.queryAllRows();
    print('All rows:');
    for (final row in rows) {
      print(row);
    }
  }

  Future<void> _update() async {
    // Updates record with _id = 1 (change if needed)
    final count = await dbHelper.update(1, {
      DatabaseHelper.colName: 'Bobby',
      DatabaseHelper.colAge: 24,
    });
    print('Updated rows: $count');
  }

  Future<void> _delete() async {
    // Deletes record with _id = 1 (change if needed)
    final count = await dbHelper.delete(1);
    print('Deleted rows: $count');
  }

  // Part 2: Query by ID
  Future<void> _queryById() async {
    final row = await dbHelper.queryById(1);
    print('Query by ID=1 result: $row');
  }

  // Part 2: Delete all
  Future<void> _deleteAll() async {
    final count = await dbHelper.deleteAll();
    print('Deleted ALL rows: $count');
  }

  Widget _btn(String text, VoidCallback onPressed) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 14),
        ),
        child: Text(text),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SQLite CRUD Buttons')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _btn('Insert', () => _insert()),
            _btn('Query All', () => _queryAll()),
            _btn('Update (ID = 1)', () => _update()),
            _btn('Delete (ID = 1)', () => _delete()),
            const Divider(height: 30),
            _btn('Query By ID (ID = 1)', () => _queryById()),
            _btn('Delete All Records', () => _deleteAll()),
          ],
        ),
      ),
    );
  }
}