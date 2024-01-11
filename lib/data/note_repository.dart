import 'note_model.dart';

abstract interface class NoteRepository {
  Future<Note> getNote();
}