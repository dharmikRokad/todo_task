import '../../domain/entities/todo_entity.dart';
import '../../domain/repositories/todo_repo.dart';
import '../datasources/local_todo_datasouce.dart';
import '../models/todo_model.dart';

class TodoRepositoryImpl implements TodoRepository {
  final LocalTodoDataSource localDataSource;

  TodoRepositoryImpl({required this.localDataSource});

  @override
  Future<List<TodoModel>> getTodos() async {
    final todoModels = await localDataSource.getTodos();
    return todoModels;
  }

  @override
  Future<void> insertTodo(TodoEntity todo) async {
    final todoModel = _toModel(todo);
    await localDataSource.insertTodo(todoModel);
  }

  @override
  Future<void> updateTodo(TodoEntity todo) async {
    final todoModel = _toModel(todo);
    await localDataSource.updateTodo(todoModel);
  }

  @override
  Future<void> deleteTodo(int id) async {
    await localDataSource.deleteTodo(id);
  }

  TodoModel _toModel(TodoEntity entity) {
    return TodoModel(
      id: entity.id,
      title: entity.title,
      description: entity.description,
      status: entity.status,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }
}
