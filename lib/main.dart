import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:my_todolist/data/note_model.dart';
import 'package:my_todolist/data/note_repository_impl.dart';
import 'package:my_todolist/ui/list_screen.dart';


void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(NoteAdapter());
  NoteRepositoryImpl().todos = await Hive.openBox<Note>('todoList.db');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ListScreen(),
    );
  }
}
