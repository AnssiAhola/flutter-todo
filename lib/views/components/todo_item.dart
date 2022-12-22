import 'package:flutter/material.dart';
import 'package:todo/models/todo.dart';

class TodoItem extends StatelessWidget {
  final Todo todo;
  final Function(Todo) onChange;
  final Function(String) onDelete;

  const TodoItem({
    super.key,
    required this.todo,
    required this.onChange,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: ListTile(
        onTap: () => onChange(todo),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        tileColor: Colors.white,
        leading: _buildCheckbox(todo),
        title: _buildText(todo),
        trailing: _buildDeleteBtn(todo),
      ),
    );
  }

  Widget _buildDeleteBtn(Todo todo) {
    const size = 40.0;
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(size / 2),
      ),
      child: IconButton(
        color: Colors.white,
        iconSize: 18,
        icon: const Icon(Icons.delete),
        onPressed: () => onDelete(todo.id),
      ),
    );
  }

  Widget _buildCheckbox(Todo todo) {
    return Checkbox(
      value: todo.completed,
      onChanged: (bool? _) => onChange(todo),
    );
  }

  Widget _buildText(Todo todo) {
    return Text(
      todo.title,
      style: TextStyle(
        fontSize: 16,
        color: Colors.black,
        decoration: todo.completed ? TextDecoration.lineThrough : null,
      ),
    );
  }
}
