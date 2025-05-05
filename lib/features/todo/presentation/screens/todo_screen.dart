import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/features/splash/presentation/widgets/info_widget.dart';
import 'package:myapp/features/todo/data/models/todo_model.dart';
import '../../../../core/di/injectioin_container.dart' as di;
import '../bloc/todo/todo_bloc.dart';
import '../bloc/todo/todo_events.dart';
import '../bloc/todo/todo_states.dart';
import '../../../../core/presentation/bloc/theme_bloc.dart';
import '../../../../core/presentation/bloc/theme_events.dart';
import '../widgets/todo_tile.dart';
import '../widgets/add_edit_todo_dialog.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      di.sl<TodoBloc>().add(LoadTodosEvent());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome back'),
        actions: [
          IconButton(
            icon: const Icon(Icons.brightness_6),
            onPressed: () {
              di.sl<ThemeBloc>().add(const ThemeEvent.toggleTheme());
            },
          ),

          IconButton(
            icon: Icon(Icons.info),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                showDragHandle: true,
                isScrollControlled: true,
                useSafeArea: true,
                builder: (context) => InfoWidget(),
              );
            },
          ),
        ],
      ),
      body: BlocBuilder<TodoBloc, TodoState>(
        bloc: di.sl<TodoBloc>(),
        builder: (context, state) {
          if (state is TodoLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is TodoLoaded) {
            final todos = [...state.todos]
              ..sort((a, b) => b.createdAt.compareTo(a.createdAt));

            if (todos.isEmpty) {
              return const Center(child: Text('No pending todos.'));
            }

            return ListView(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              children:
                  todos.map((todo) => TodoTile(todo: todo)).toList().toList(),
            );
          } else if (state is TodoError) {
            return Center(child: Text('Error: ${state.message}'));
          }
          return const SizedBox();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await showDialog<TodoModel>(
            context: context,
            builder: (_) => const AddEditTodoDialog(),
          );

          if (result != null) {
            di.sl<TodoBloc>().add(AddTodoEvent(result));
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
