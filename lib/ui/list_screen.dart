import 'package:flutter/material.dart';
import 'package:my_todolist/data/note_repository_impl.dart';
import 'package:my_todolist/ui/widgets/todo_item.dart';
import 'create_screen.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Note'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: ListView(
                children: NoteRepositoryImpl()
                    .todos
                    .values
                    .map(
                      (todo) => TodoItem(
                        todo: todo,
                        onTap: (e) async {
                          e.description = '';
                          await todo.save();
                          setState(() {});
                        },
                        onDelete: (Todo) async {
                          await todo.delete();
                          setState(() {});
                        },
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CreateScreen()),
          );
          setState(() {});
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
