import 'package:get_it/get_it.dart';
import 'package:myapp/features/todo/data/datasources/local_todo_datasouce.dart';
import 'package:myapp/features/todo/data/repositories/to_do_repo_impl.dart';
import 'package:myapp/features/todo/domain/repositories/todo_repo.dart';
import 'package:myapp/features/todo/domain/usecases/delete_todo_usecase.dart';
import 'package:myapp/features/todo/domain/usecases/get_todos_usecase.dart';
import 'package:myapp/features/todo/domain/usecases/insert_todo_usecase.dart';
import 'package:myapp/features/todo/domain/usecases/update_todo_usecase.dart';
import '../../features/todo/presentation/bloc/todo/todo_bloc.dart';
import '../presentation/bloc/theme_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Initialize datasource
  final localDataSource = LocalTodoDataSourceImpl();
  await localDataSource.initDB();

  // BLoC
  sl.registerLazySingleton(
    () => TodoBloc(
      insertTodoUseCase: sl(),
      getTodosUseCase: sl(),
      updateTodoUseCase: sl(),
      deleteTodoUseCase: sl(),
    ),
  );

  sl.registerLazySingleton(() => ThemeBloc());

  // Usecases
  sl.registerLazySingleton(() => InsertTodoUsecase(sl()));
  sl.registerLazySingleton(() => GetTodosUsecase(sl()));
  sl.registerLazySingleton(() => UpdateTodoUsecase(sl()));
  sl.registerLazySingleton(() => DeleteTodoUsecase(sl()));

  // Repository
  sl.registerLazySingleton<TodoRepository>(
    () => TodoRepositoryImpl(localDataSource: sl()),
  );

  // DataSource
  sl.registerLazySingleton<LocalTodoDataSource>(() => localDataSource);
}
