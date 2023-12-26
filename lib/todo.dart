import 'package:hive/hive.dart';
part 'todo.g.dart';

@HiveType(typeId: 0)
class Todo extends HiveObject {
  @HiveField(0)
  int? id;

  @HiveField(1)
  String title;

  @HiveField(2)
  int dateTime;

  @HiveField(3)
  bool isDone;

//<editor-fold desc="Data Methods">
  Todo({
    this.id,
    required this.title,
    required this.dateTime,
    required this.isDone,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Todo &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          title == other.title &&
          dateTime == other.dateTime &&
          isDone == other.isDone);

  @override
  int get hashCode =>
      id.hashCode ^ title.hashCode ^ dateTime.hashCode ^ isDone.hashCode;

  @override
  String toString() {
    return 'Todo{' +
        ' id: $id,' +
        ' title: $title,' +
        ' dateTime: $dateTime,' +
        ' isDone: $isDone,' +
        '}';
  }

  Todo copyWith({
    int? id,
    String? title,
    int? dateTime,
    bool? isDone,
  }) {
    return Todo(
      id: id ?? this.id,
      title: title ?? this.title,
      dateTime: dateTime ?? this.dateTime,
      isDone: isDone ?? this.isDone,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'title': this.title,
      'dateTime': this.dateTime,
      'isDone': this.isDone,
    };
  }

  factory Todo.fromMap(Map<String, dynamic> map) {
    return Todo(
      id: map['id'] as int,
      title: map['title'] as String,
      dateTime: map['dateTime'] as int,
      isDone: map['isDone'] as bool,
    );
  }

//</editor-fold>
}