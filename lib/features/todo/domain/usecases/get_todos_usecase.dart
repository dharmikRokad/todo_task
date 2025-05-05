import 'package:myapp/features/todo/data/models/todo_model.dart';

import '../repositories/todo_repo.dart';

class GetTodosUsecase {
  final TodoRepository repository;

  GetTodosUsecase(this.repository);

  Future<List<TodoModel>> call() async {
    return await repository.getTodos();
  }
}
