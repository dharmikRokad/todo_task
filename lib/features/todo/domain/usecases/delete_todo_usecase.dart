import '../repositories/todo_repo.dart';

class DeleteTodoUsecase {
  final TodoRepository repository;

  DeleteTodoUsecase(this.repository);

  Future<void> call(int id) async {
    await repository.deleteTodo(id);
  }
}
