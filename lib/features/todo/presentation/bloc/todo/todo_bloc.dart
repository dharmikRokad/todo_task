import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entities/todo_entity.dart';
import '../../../domain/usecases/get_todos_usecase.dart';
import '../../../domain/usecases/insert_todo_usecase.dart';
import '../../../domain/usecases/update_todo_usecase.dart';
import '../../../domain/usecases/delete_todo_usecase.dart';
import 'todo_events.dart';
import 'todo_states.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final GetTodosUsecase getTodosUseCase;
  final InsertTodoUsecase insertTodoUseCase;
  final UpdateTodoUsecase updateTodoUseCase;
  final DeleteTodoUsecase deleteTodoUseCase;

  TodoBloc({
    required this.getTodosUseCase,
    required this.insertTodoUseCase,
    required this.updateTodoUseCase,
    required this.deleteTodoUseCase,
  }) : super(const TodoState.initial()) {
    on<LoadTodosEvent>(_onLoadTodos);
    on<AddTodoEvent>(_onAddTodo);
    on<UpdateTodoEvent>(_onUpdateTodo);
    on<DeleteTodoEvent>(_onDeleteTodo);
    on<ToggleTodoStatusEvent>(_onToggleTodoStatus);
  }

  Future<void> _onLoadTodos(
    LoadTodosEvent event,
    Emitter<TodoState> emit,
  ) async {
    emit(const TodoState.loading());
    try {
      final todos = await getTodosUseCase();
      emit(TodoState.loaded(todos));
    } catch (e) {
      emit(TodoState.error(e.toString()));
    }
  }

  Future<void> _onAddTodo(AddTodoEvent event, Emitter<TodoState> emit) async {
    try {
      await insertTodoUseCase(event.todo);
      add(const LoadTodosEvent());
    } catch (e) {
      emit(TodoState.error(e.toString()));
    }
  }

  Future<void> _onUpdateTodo(
    UpdateTodoEvent event,
    Emitter<TodoState> emit,
  ) async {
    try {
      await updateTodoUseCase(event.todo);
      add(const LoadTodosEvent());
    } catch (e) {
      emit(TodoState.error(e.toString()));
    }
  }

  Future<void> _onDeleteTodo(
    DeleteTodoEvent event,
    Emitter<TodoState> emit,
  ) async {
    try {
      await deleteTodoUseCase(event.id);
      add(const LoadTodosEvent());
    } catch (e) {
      emit(TodoState.error(e.toString()));
    }
  }

  Future<void> _onToggleTodoStatus(
    ToggleTodoStatusEvent event,
    Emitter<TodoState> emit,
  ) async {
    try {
      final updatedTodo = event.todo.copyWith(
        status:
            event.todo.status == TodoStatus.pending
                ? TodoStatus.done
                : TodoStatus.pending,
        updatedAt: DateTime.now(),
      );
      await updateTodoUseCase(updatedTodo);
      add(const LoadTodosEvent());
    } catch (e) {
      emit(TodoState.error(e.toString()));
    }
  }
}
