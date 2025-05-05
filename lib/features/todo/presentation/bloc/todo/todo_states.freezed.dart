// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todo_states.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TodoState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is TodoState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'TodoState()';
  }
}

/// @nodoc
class $TodoStateCopyWith<$Res> {
  $TodoStateCopyWith(TodoState _, $Res Function(TodoState) __);
}

/// @nodoc

class TodoInitial implements TodoState {
  const TodoInitial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is TodoInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'TodoState.initial()';
  }
}

/// @nodoc

class TodoLoading implements TodoState {
  const TodoLoading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is TodoLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'TodoState.loading()';
  }
}

/// @nodoc

class TodoLoaded implements TodoState {
  const TodoLoaded(final List<TodoModel> todos) : _todos = todos;

  final List<TodoModel> _todos;
  List<TodoModel> get todos {
    if (_todos is EqualUnmodifiableListView) return _todos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_todos);
  }

  /// Create a copy of TodoState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TodoLoadedCopyWith<TodoLoaded> get copyWith =>
      _$TodoLoadedCopyWithImpl<TodoLoaded>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TodoLoaded &&
            const DeepCollectionEquality().equals(other._todos, _todos));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_todos));

  @override
  String toString() {
    return 'TodoState.loaded(todos: $todos)';
  }
}

/// @nodoc
abstract mixin class $TodoLoadedCopyWith<$Res>
    implements $TodoStateCopyWith<$Res> {
  factory $TodoLoadedCopyWith(
          TodoLoaded value, $Res Function(TodoLoaded) _then) =
      _$TodoLoadedCopyWithImpl;
  @useResult
  $Res call({List<TodoModel> todos});
}

/// @nodoc
class _$TodoLoadedCopyWithImpl<$Res> implements $TodoLoadedCopyWith<$Res> {
  _$TodoLoadedCopyWithImpl(this._self, this._then);

  final TodoLoaded _self;
  final $Res Function(TodoLoaded) _then;

  /// Create a copy of TodoState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? todos = null,
  }) {
    return _then(TodoLoaded(
      null == todos
          ? _self._todos
          : todos // ignore: cast_nullable_to_non_nullable
              as List<TodoModel>,
    ));
  }
}

/// @nodoc

class TodoError implements TodoState {
  const TodoError(this.message);

  final String message;

  /// Create a copy of TodoState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TodoErrorCopyWith<TodoError> get copyWith =>
      _$TodoErrorCopyWithImpl<TodoError>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TodoError &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'TodoState.error(message: $message)';
  }
}

/// @nodoc
abstract mixin class $TodoErrorCopyWith<$Res>
    implements $TodoStateCopyWith<$Res> {
  factory $TodoErrorCopyWith(TodoError value, $Res Function(TodoError) _then) =
      _$TodoErrorCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$TodoErrorCopyWithImpl<$Res> implements $TodoErrorCopyWith<$Res> {
  _$TodoErrorCopyWithImpl(this._self, this._then);

  final TodoError _self;
  final $Res Function(TodoError) _then;

  /// Create a copy of TodoState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(TodoError(
      null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
