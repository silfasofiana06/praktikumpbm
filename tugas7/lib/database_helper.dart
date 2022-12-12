import 'diary.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static DatabaseHelper? _databaseHelper;

  DatabaseHelper._internal() {
    _databaseHelper = this;
  }

  factory DatabaseHelper() => _databaseHelper ?? DatabaseHelper._internal();

  static late Database _database;

  Future<Database> get database async {
    return _database = await _initializeDb();
  }

  static const String _tableName = 'todos';

  Future<Database> _initializeDb() async {
    var path = await getDatabasesPath();
    var db = openDatabase(
      join(path, 'diary_db.db'),
      onCreate: (db, version) async {
        await db.execute(
            '''CREATE TABLE $_tableName (id INTEGER PRIMARY KEY, judul TEXT, isi TEXT)''');
      },
      version: 1,
    );
    return db;
  }

  Future<void> insertDiary(Diary diary) async {
    final Database db = await database;
    await db.insert(
      _tableName,
      diary.toMap(),
    );
  }

  Future<List<Diary>> getDiaries() async {
    final Database db = await database;
    List<Map<String, dynamic>> result = await db.query(_tableName);

    return result.map((res) => Diary.fromMap(res)).toList();
  }

  Future<int> deleteDiary(int id) async {
    final Database db = await database;
    return await db.delete(_tableName, where: 'id = ?', whereArgs: [id]);
  }

  Future<int> updateDiary(Diary diary) async {
    final Database db = await database;
    return await db.update(_tableName, diary.toMap(),
        where: 'id = ?', whereArgs: [diary.id]);
  }
}
