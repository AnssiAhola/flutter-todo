import 'package:uuid/uuid.dart';

class Todo implements Comparable {
  String id;
  String title;
  DateTime created;
  bool completed = false;

  Todo({
    required this.id,
    required this.title,
    required this.created,
    required this.completed,
  });

  factory Todo.create(String title, {bool completed = false}) {
    return Todo(
      id: const Uuid().v5(null, null),
      title: title,
      created: DateTime.now(),
      completed: completed,
    );
  }

  @override
  int compareTo(other) {
    return other.created.compareTo(created);
  }
}
