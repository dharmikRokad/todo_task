// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todo_events.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TodoEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is TodoEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'TodoEvent()';
  }
}

/// @nodoc
class $TodoEventCopyWith<$Res> {
  $TodoEventCopyWith(TodoEvent _, $Res Function(TodoEvent) __);
}

/// @nodoc

class LoadTodosEvent implements TodoEvent {
  const LoadTodosEvent();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is LoadTodosEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'TodoEvent.loadTodos()';
  }
}

/// @nodoc

class AddTodoEvent implements TodoEvent {
  const AddTodoEvent(this.todo);

  final TodoModel todo;

  /// Create a copy of TodoEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AddTodoEventCopyWith<AddTodoEvent> get copyWith =>
      _$AddTodoEventCopyWithImpl<AddTodoEvent>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AddTodoEvent &&
            (identical(other.todo, todo) || other.todo == todo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, todo);

  @override
  String toString() {
    return 'TodoEvent.addTodo(todo: $todo)';
  }
}

/// @nodoc
abstract mixin class $AddTodoEventCopyWith<$Res>
    implements $TodoEventCopyWith<$Res> {
  factory $AddTodoEventCopyWith(
          AddTodoEvent value, $Res Function(AddTodoEvent) _then) =
      _$AddTodoEventCopyWithImpl;
  @useResult
  $Res call({TodoModel todo});
}

/// @nodoc
class _$AddTodoEventCopyWithImpl<$Res> implements $AddTodoEventCopyWith<$Res> {
  _$AddTodoEventCopyWithImpl(this._self, this._then);

  final AddTodoEvent _self;
  final $Res Function(AddTodoEvent) _then;

  /// Create a copy of TodoEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? todo = null,
  }) {
    return _then(AddTodoEvent(
      null == todo
          ? _self.todo
          : todo // ignore: cast_nullable_to_non_nullable
              as TodoModel,
    ));
  }
}

/// @nodoc

class UpdateTodoEvent implements TodoEvent {
  const UpdateTodoEvent(this.todo);

  final TodoModel todo;

  /// Create a copy of TodoEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UpdateTodoEventCopyWith<UpdateTodoEvent> get copyWith =>
      _$UpdateTodoEventCopyWithImpl<UpdateTodoEvent>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UpdateTodoEvent &&
            (identical(other.todo, todo) || other.todo == todo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, todo);

  @override
  String toString() {
    return 'TodoEvent.updateTodo(todo: $todo)';
  }
}

/// @nodoc
abstract mixin class $UpdateTodoEventCopyWith<$Res>
    implements $TodoEventCopyWith<$Res> {
  factory $UpdateTodoEventCopyWith(
          UpdateTodoEvent value, $Res Function(UpdateTodoEvent) _then) =
      _$UpdateTodoEventCopyWithImpl;
  @useResult
  $Res call({TodoModel todo});
}

/// @nodoc
class _$UpdateTodoEventCopyWithImpl<$Res>
    implements $UpdateTodoEventCopyWith<$Res> {
  _$UpdateTodoEventCopyWithImpl(this._self, this._then);

  final UpdateTodoEvent _self;
  final $Res Function(UpdateTodoEvent) _then;

  /// Create a copy of TodoEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? todo = null,
  }) {
    return _then(UpdateTodoEvent(
      null == todo
          ? _self.todo
          : todo // ignore: cast_nullable_to_non_nullable
              as TodoModel,
    ));
  }
}

/// @nodoc

class DeleteTodoEvent implements TodoEvent {
  const DeleteTodoEvent(this.id);

  final int id;

  /// Create a copy of TodoEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DeleteTodoEventCopyWith<DeleteTodoEvent> get copyWith =>
      _$DeleteTodoEventCopyWithImpl<DeleteTodoEvent>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DeleteTodoEvent &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @override
  String toString() {
    return 'TodoEvent.deleteTodo(id: $id)';
  }
}

/// @nodoc
abstract mixin class $DeleteTodoEventCopyWith<$Res>
    implements $TodoEventCopyWith<$Res> {
  factory $DeleteTodoEventCopyWith(
          DeleteTodoEvent value, $Res Function(DeleteTodoEvent) _then) =
      _$DeleteTodoEventCopyWithImpl;
  @useResult
  $Res call({int id});
}

/// @nodoc
class _$DeleteTodoEventCopyWithImpl<$Res>
    implements $DeleteTodoEventCopyWith<$Res> {
  _$DeleteTodoEventCopyWithImpl(this._self, this._then);

  final DeleteTodoEvent _self;
  final $Res Function(DeleteTodoEvent) _then;

  /// Create a copy of TodoEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
  }) {
    return _then(DeleteTodoEvent(
      null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class ToggleTodoStatusEvent implements TodoEvent {
  const ToggleTodoStatusEvent(this.todo);

  final TodoModel todo;

  /// Create a copy of TodoEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ToggleTodoStatusEventCopyWith<ToggleTodoStatusEvent> get copyWith =>
      _$ToggleTodoStatusEventCopyWithImpl<ToggleTodoStatusEvent>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ToggleTodoStatusEvent &&
            (identical(other.todo, todo) || other.todo == todo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, todo);

  @override
  String toString() {
    return 'TodoEvent.toggleTodoStatus(todo: $todo)';
  }
}

/// @nodoc
abstract mixin class $ToggleTodoStatusEventCopyWith<$Res>
    implements $TodoEventCopyWith<$Res> {
  factory $ToggleTodoStatusEventCopyWith(ToggleTodoStatusEvent value,
          $Res Function(ToggleTodoStatusEvent) _then) =
      _$ToggleTodoStatusEventCopyWithImpl;
  @useResult
  $Res call({TodoModel todo});
}

/// @nodoc
class _$ToggleTodoStatusEventCopyWithImpl<$Res>
    implements $ToggleTodoStatusEventCopyWith<$Res> {
  _$ToggleTodoStatusEventCopyWithImpl(this._self, this._then);

  final ToggleTodoStatusEvent _self;
  final $Res Function(ToggleTodoStatusEvent) _then;

  /// Create a copy of TodoEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? todo = null,
  }) {
    return _then(ToggleTodoStatusEvent(
      null == todo
          ? _self.todo
          : todo // ignore: cast_nullable_to_non_nullable
              as TodoModel,
    ));
  }
}

// dart format on
