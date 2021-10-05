import 'dart:convert';

class Task {
  final int id;
  final String title;
  final String description;

  Task({required this.id, required this.title, required this.description});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: int.parse(map['id'].toString()),
      title: map['title'].toString(),
      description: map['description'].toString(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Task.fromJson(String source) =>
      Task.fromMap(json.decode(source) as Map<String, dynamic>);
}
