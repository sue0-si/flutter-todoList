import 'package:hive/hive.dart';
part 'note_model.g.dart';

@HiveType(typeId: 0)
class Note extends HiveObject {
  @HiveField(0)
  int? id;

  @HiveField(1)
  String title;

  @HiveField(2)
  String description;

//<editor-fold desc="Data Methods">
  Note({
    this.id,
    required this.title,
    required this.description,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Note &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          title == other.title &&
          description == other.description);

  @override
  int get hashCode => id.hashCode ^ title.hashCode ^ description.hashCode;

  @override
  String toString() {
    return 'Note{' +
        ' id: $id,' +
        ' title: $title,' +
        ' description: $description,' +
        '}';
  }

  Note copyWith({
    int? id,
    String? title,
    String? description,
  }) {
    return Note(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'title': this.title,
      'description': this.description,
    };
  }

  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      id: map['id'] as int,
      title: map['title'] as String,
      description: map['description'] as String,
    );
  }

//</editor-fold>
}