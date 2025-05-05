import '../entities/todo_entity.dart';
import '../repositories/todo_repo.dart';

class InsertTodoUsecase {
  final TodoRepository repository;

  InsertTodoUsecase(this.repository);

  Future<void> call(TodoEntity todo) async {
    await repository.insertTodo(todo);
  }
}
