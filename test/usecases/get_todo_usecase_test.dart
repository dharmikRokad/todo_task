import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:myapp/features/todo/data/models/todo_model.dart';
import 'package:myapp/features/todo/domain/usecases/get_todos_usecase.dart';
import 'package:myapp/features/todo/domain/entities/todo_entity.dart';

import '../mocks/mocks.mocks.dart';

void main() {
  late GetTodosUsecase usecase;
  late MockTodoRepository mockRepo;

  setUp(() {
    mockRepo = MockTodoRepository();
    usecase = GetTodosUsecase(mockRepo);
  });

  test('should get todos from repository', () async {
    final todos = [
      TodoModel(
        id: 1,
        title: 'Task',
        description: 'Desc',
        status: TodoStatus.pending,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
    ];

    when(mockRepo.getTodos()).thenAnswer((_) async => todos);

    final result = await usecase();

    expect(result, todos);
    verify(mockRepo.getTodos());
    verifyNoMoreInteractions(mockRepo);
  });
}
