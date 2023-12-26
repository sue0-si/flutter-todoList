import 'package:flutter/material.dart';
import 'package:my_todolist/create_screen.dart';
import 'package:my_todolist/todo.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  final todos = [
    Todo(dateTime: 123, title: 'title 1'),
    Todo(dateTime: 123, title: 'title 1'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo list'),
      ),
      body: ListView(
        children: todos.map(
            (todo) => ListTile(
              title: Text(todo.title),
              subtitle: Text('${todo.dateTime}'),
            ),
        ).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CreateScreen()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
