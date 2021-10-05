import 'dart:convert';

import 'package:get/get.dart';

class Todo {
  final int id;
  final int taskId;
  final String title;
  RxInt isDone = 0.obs;
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
      id: int.parse(map['id'].toString()),
      taskId: int.parse(map['taskId'].toString()),
      title: map['title'].toString(),
      isDone: int.parse(map['isDone'].toString()).obs,
    );
  }

  String toJson() => json.encode(toMap());

  factory Todo.fromJson(String source) =>
      Todo.fromMap(json.decode(source) as Map<String, dynamic>);
}
