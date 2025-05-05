import 'package:flutter/material.dart';
import 'package:myapp/features/todo/data/models/todo_model.dart';
import '../../domain/entities/todo_entity.dart';

class AddEditTodoDialog extends StatefulWidget {
  final TodoEntity? todo;

  const AddEditTodoDialog({super.key, this.todo});

  @override
  State<AddEditTodoDialog> createState() => _AddEditTodoDialogState();
}

class _AddEditTodoDialogState extends State<AddEditTodoDialog> {
  final _formKey = GlobalKey<FormState>();
  late String _title;
  late String _description;
  bool _isDone = false;

  @override
  void initState() {
    super.initState();
    _title = widget.todo?.title ?? '';
    _description = widget.todo?.description ?? '';
    _isDone = widget.todo?.status == TodoStatus.done;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.todo == null ? 'Add ToDo' : 'Edit ToDo'),
      content: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                initialValue: _title,
                decoration: const InputDecoration(labelText: 'Title'),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Enter title' : null,
                onSaved: (value) => _title = value ?? '',
              ),
              const SizedBox(height: 12),
              TextFormField(
                initialValue: _description,
                decoration: const InputDecoration(labelText: 'Description'),
                validator: (value) => value == null || value.isEmpty
                    ? 'Enter description'
                    : null,
                onSaved: (value) => _description = value ?? '',
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Checkbox(
                      value: _isDone,
                      onChanged: (value) {
                        setState(() {
                          _isDone = value ?? false;
                        });
                      }),
                  const Text('Mark as Done')
                ],
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel')),
        ElevatedButton(
            onPressed: () {
              if (_formKey.currentState?.validate() ?? false) {
                _formKey.currentState?.save();
                final newTodo = TodoModel(
                  id: widget.todo?.id,
                  title: _title,
                  description: _description,
                  status: _isDone ? TodoStatus.done : TodoStatus.pending,
                  createdAt: widget.todo?.createdAt ?? DateTime.now(),
                  updatedAt: DateTime.now(),
                );
                Navigator.pop(context, newTodo);
              }
            },
            child: const Text('Save'))
      ],
    );
  }
}
