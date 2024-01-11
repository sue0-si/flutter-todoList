import 'package:hive/hive.dart';
import 'package:my_todolist/data/note_model.dart';

import 'note_repository.dart';

class NoteRepositoryImpl implements NoteRepository {
  late final Box<Note> todos;
  final String _title = '';
  final String _description = '';

  @override
  Future<Note> getNote() async {
    return Note(title: _title, description: _description);
  }


}
