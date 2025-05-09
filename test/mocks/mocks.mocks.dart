// Mocks generated by Mockito 5.4.6 from annotations
// in myapp/test/mocks/mocks.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:mockito/mockito.dart' as _i1;
import 'package:myapp/features/todo/data/models/todo_model.dart' as _i4;
import 'package:myapp/features/todo/domain/entities/todo_entity.dart' as _i5;
import 'package:myapp/features/todo/domain/repositories/todo_repo.dart' as _i2;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: must_be_immutable
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

/// A class which mocks [TodoRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockTodoRepository extends _i1.Mock implements _i2.TodoRepository {
  MockTodoRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<List<_i4.TodoModel>> getTodos() => (super.noSuchMethod(
        Invocation.method(
          #getTodos,
          [],
        ),
        returnValue: _i3.Future<List<_i4.TodoModel>>.value(<_i4.TodoModel>[]),
      ) as _i3.Future<List<_i4.TodoModel>>);

  @override
  _i3.Future<void> insertTodo(_i5.TodoEntity? todo) => (super.noSuchMethod(
        Invocation.method(
          #insertTodo,
          [todo],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);

  @override
  _i3.Future<void> updateTodo(_i5.TodoEntity? todo) => (super.noSuchMethod(
        Invocation.method(
          #updateTodo,
          [todo],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);

  @override
  _i3.Future<void> deleteTodo(int? id) => (super.noSuchMethod(
        Invocation.method(
          #deleteTodo,
          [id],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);
}
