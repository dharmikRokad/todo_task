enum TodoStatus { pending, done }

class TodoEntity {
  final int? id;
  final String title;
  final String description;
  final TodoStatus status;
  final DateTime createdAt;
  final DateTime updatedAt;

  const TodoEntity({
    this.id,
    required this.title,
    required this.description,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });
}
