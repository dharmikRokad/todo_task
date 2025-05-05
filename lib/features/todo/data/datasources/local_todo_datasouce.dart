import 'package:sqflite/sqflite.dart';
import '../models/todo_model.dart';

abstract class LocalTodoDataSource {
  Future<List<TodoModel>> getTodos();
  Future<void> insertTodo(TodoModel todo);
  Future<void> updateTodo(TodoModel todo);
  Future<void> deleteTodo(int id);
  Future<void> initDB();
}

class LocalTodoDataSourceImpl implements LocalTodoDataSource {
  late final Database database;

  LocalTodoDataSourceImpl();

  static const String tableName = 'todos';

  @override
  Future<List<TodoModel>> getTodos() async {
    final result = await database.query(tableName);
    return result.map((map) => TodoModel.fromMap(map)).toList();
  }

  @override
  Future<void> insertTodo(TodoModel todo) async {
    await database.insert(
      tableName,
      todo.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  Future<void> updateTodo(TodoModel todo) async {
    await database.update(
      tableName,
      todo.toMap(),
      where: 'id = ?',
      whereArgs: [todo.id],
    );
  }

  @override
  Future<void> deleteTodo(int id) async {
    await database.delete(tableName, where: 'id = ?', whereArgs: [id]);
  }

  @override
  Future<void> initDB() async {
    database = await openDatabase(
      'todo_app.db',
      version: 1,
      onCreate: (db, version) {
        return db.execute('''
          CREATE TABLE $tableName (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT NOT NULL,
            description TEXT NOT NULL,
            status INTEGER NOT NULL,
            createdAt TEXT NOT NULL,
            updatedAt TEXT NOT NULL
          )
        ''');
      },
    );
  }
}
