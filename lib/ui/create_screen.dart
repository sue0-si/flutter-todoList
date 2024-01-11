import 'package:flutter/material.dart';
import 'package:my_todolist/data/note_model.dart';
import 'package:my_todolist/data/note_repository_impl.dart';

class CreateScreen extends StatefulWidget {
  const CreateScreen({super.key});

  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New task'),
        actions: [
          IconButton(
            onPressed: () async {
              // save in DB
              await NoteRepositoryImpl().todos.add(Note(
                title: _titleController.text, description: '',

              ));

              if (mounted) {
                Navigator.pop(context);
              }
            },
            icon: const Icon(Icons.done),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          controller: _titleController,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            hintStyle: TextStyle(color: Colors.grey[800]),
            hintText: 'Enter task',
            filled: true,
            fillColor: Colors.white70,
          ),
        ),
      ),
    );
  }
}
