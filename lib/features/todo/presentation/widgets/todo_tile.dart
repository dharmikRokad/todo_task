import 'package:flutter/material.dart';
import 'package:myapp/features/todo/data/models/todo_model.dart';
import '../../domain/entities/todo_entity.dart';
import '../../../../core/di/injectioin_container.dart' as di;
import '../bloc/todo/todo_bloc.dart';
import '../bloc/todo/todo_events.dart';
import 'add_edit_todo_dialog.dart';

class TodoTile extends StatelessWidget {
  final TodoModel todo;

  const TodoTile({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    Color getStatusColor() {
      return todo.status == TodoStatus.done
          ? Colors.green.withOpacity(0.2)
          : Colors.orange.withOpacity(0.2);
    }

    return Dismissible(
      key: Key(todo.id.toString()),
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      confirmDismiss: (direction) async {
        return await showDialog<bool>(
          context: context,
          builder:
              (_) => AlertDialog(
                title: const Text('Delete ToDo'),
                content: const Text(
                  'Are you sure you want to delete this todo?',
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context, false),
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () => Navigator.pop(context, true),
                    child: const Text('Delete'),
                  ),
                ],
              ),
        );
      },
      onDismissed: (_) {
        di.sl<TodoBloc>().add(DeleteTodoEvent(todo.id!));
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: getStatusColor(),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Checkbox(
              value: todo.status == TodoStatus.done,
              onChanged: (value) {
                di.sl<TodoBloc>().add(
                  UpdateTodoEvent(
                    todo.copyWith(
                      status: value! ? TodoStatus.done : TodoStatus.pending,
                    ),
                  ),
                );
              },
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    todo.title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(todo.description, style: const TextStyle(fontSize: 14)),
                ],
              ),
            ),
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () async {
                final result = await showDialog<TodoModel>(
                  context: context,
                  builder: (_) => AddEditTodoDialog(todo: todo),
                );
                if (result != null) {
                  di.sl<TodoBloc>().add(UpdateTodoEvent(result));
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
