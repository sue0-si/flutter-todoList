class Todo {
  String title;
  int dateTime;

//<editor-fold desc="Data Methods">
  Todo({
    required this.title,
    required this.dateTime,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Todo &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          dateTime == other.dateTime);

  @override
  int get hashCode => title.hashCode ^ dateTime.hashCode;

  @override
  String toString() {
    return 'Todo{' + ' title: $title,' + ' dateTime: $dateTime,' + '}';
  }

  Todo copyWith({
    String? title,
    int? dateTime,
  }) {
    return Todo(
      title: title ?? this.title,
      dateTime: dateTime ?? this.dateTime,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': this.title,
      'dateTime': this.dateTime,
    };
  }

  factory Todo.fromJson(Map<String, dynamic> map) {
    return Todo(
      title: map['title'] as String,
      dateTime: map['dateTime'] as int,
    );
  }

//</editor-fold>
}