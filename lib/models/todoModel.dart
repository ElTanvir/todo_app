import 'dart:convert';

class Todo {
  final int id;
  final int taskId;
  final String title;
  final int isDone;
  Todo({
    required this.id,
    required this.taskId,
    required this.title,
    required this.isDone,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'taskId': taskId,
      'title': title,
      'isDone': isDone,
    };
  }

  factory Todo.fromMap(Map<String, dynamic> map) {
    return Todo(
      id: map['id'],
      taskId: map['taskId'],
      title: map['title'],
      isDone: map['isDone'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Todo.fromJson(String source) => Todo.fromMap(json.decode(source));
}
