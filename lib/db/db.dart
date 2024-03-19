import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo/models/todo.dart';

class DataBase {
  Future<Database> initializeDB() async {
    String path = await getDatabasesPath();
    return openDatabase(join(path, 'todo_db.db'), version: 1,
        onCreate: (db, version) async {
      await db.execute(
        'CREATE TABLE undone (id INTEGER PRIMARY KEY, title TEXT, details TEXT, isDone INTEGER)',
      );
    });
  }

  Future<int> insertTodo(Todo todo) async {
    final Database db = await initializeDB();
    return db.insert('undone', todo.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<int> updateTodo(Todo todo) async {
    final Database db = await initializeDB();
    return db.insert('undone', todo.toMapUpdate(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<int> deleteTodo(int id) async {
    final db = await initializeDB();
    return db.delete('undone', where: "id = ?", whereArgs: [id]);
  }

  Future<List<Todo>> getTodo() async {
    final Database db = await initializeDB();
    List<Map<String, Object?>> result = await db.query('undone');
    return result.map((e) => Todo.fromMap(e)).toList();
  }
}
