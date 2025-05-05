import 'package:myapp/features/todo/data/models/todo_model.dart';

import '../entities/todo_entity.dart';

abstract class TodoRepository {
  Future<List<TodoModel>> getTodos();
  Future<void> insertTodo(TodoEntity todo);
  Future<void> updateTodo(TodoEntity todo);
  Future<void> deleteTodo(int id);
}
