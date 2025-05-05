import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:myapp/features/todo/data/models/todo_model.dart';

part 'todo_events.freezed.dart';

@freezed
class TodoEvent with _$TodoEvent {
  const factory TodoEvent.loadTodos() = LoadTodosEvent;
  const factory TodoEvent.addTodo(TodoModel todo) = AddTodoEvent;
  const factory TodoEvent.updateTodo(TodoModel todo) = UpdateTodoEvent;
  const factory TodoEvent.deleteTodo(int id) = DeleteTodoEvent;
  const factory TodoEvent.toggleTodoStatus(TodoModel todo) =
      ToggleTodoStatusEvent;
}
