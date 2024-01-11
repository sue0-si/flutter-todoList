import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_todolist/data/note_model.dart';

class TodoItem extends StatelessWidget {
  final Note todo;
  final Function(Note) onTap;
  final Function(Note) onDelete;

  const TodoItem({
    super.key,
    required this.todo,
    required this.onTap,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        onTap(todo);
      },
      title: Text(
        todo.title,
        style: const TextStyle(color: Colors.black),
      ),
      trailing: const Icon(Icons.delete_forever),
    );
  }
}
