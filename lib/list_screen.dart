import 'package:flutter/material.dart';
import 'package:my_todolist/create_screen.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo list'),
      ),
      body: ListView(
        children: const [
          ListTile(
            title: Text('title 1'),
            subtitle: Text('subtitle 1'),
          ),
          ListTile(
            title: Text('title 2'),
            subtitle: Text('subtitle 2'),
          ),
        ],
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
