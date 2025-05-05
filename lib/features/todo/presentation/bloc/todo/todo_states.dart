import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:myapp/features/todo/data/models/todo_model.dart';

part 'todo_states.freezed.dart';

@freezed
class TodoState with _$TodoState {
  const factory TodoState.initial() = TodoInitial;
  const factory TodoState.loading() = TodoLoading;
  const factory TodoState.loaded(List<TodoModel> todos) = TodoLoaded;
  const factory TodoState.error(String message) = TodoError;
}
