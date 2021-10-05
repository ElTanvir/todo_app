import 'package:get/get.dart';
import 'package:todo_app/models/task_model.dart';
import 'package:todo_app/models/todo_model.dart';

List<Task> tasks = [
  Task(
    id: 0,
    title: "This Is Task 0",
    description: "This is Task 0 Description",
  ),
  Task(
    id: 1,
    title: "This Is Task 1",
    description: "This is Task 1 Description",
  ),
  Task(
    id: 2,
    title: "This Is Task 2",
    description: "This is Task 2 Description",
  ),
  Task(
    id: 3,
    title: "This Is Task 3",
    description: "This is Task 3 Description",
  ),
  Task(
    id: 4,
    title: "This Is Task 4",
    description: "This is Task 4 Description",
  ),
  Task(
    id: 5,
    title: "This Is Task 5",
    description: "This is Task 5 Description",
  ),
  Task(
    id: 6,
    title: "This Is Task 6",
    description: "This is Task 6 Description",
  ),
  Task(
    id: 7,
    title: "This Is Task 7",
    description: "This is Task 7 Description",
  ),
  Task(
    id: 8,
    title: "This Is Task 8",
    description: "This is Task 8 Description",
  ),
];

List<Todo> todos = [
  Todo(id: 0, taskId: 0, title: "Task 0 Todo Title 01", isDone: 0.obs),
  Todo(id: 0, taskId: 0, title: "Task 0 Todo Title 02", isDone: 0.obs),
  Todo(id: 0, taskId: 0, title: "Task 0 Todo Title 03", isDone: 0.obs),
  Todo(id: 0, taskId: 0, title: "Task 0 Todo Title 04", isDone: 0.obs),
  Todo(id: 0, taskId: 0, title: "Task 0 Todo Title 05", isDone: 0.obs),
  Todo(id: 1, taskId: 1, title: "Task 1 Todo Title 01", isDone: 0.obs),
  Todo(id: 2, taskId: 2, title: "Task 2 Todo Title 01", isDone: 0.obs),
  Todo(id: 3, taskId: 3, title: "Task 3 Todo Title 01", isDone: 0.obs),
  Todo(id: 4, taskId: 4, title: "Task 4 Todo Title 01", isDone: 0.obs),
  Todo(id: 5, taskId: 5, title: "Task 5 Todo Title 01", isDone: 0.obs),
  Todo(id: 6, taskId: 6, title: "Task 6 Todo Title 01", isDone: 0.obs),
  Todo(id: 7, taskId: 7, title: "Task 7 Todo Title 01", isDone: 0.obs),
  Todo(id: 8, taskId: 8, title: "Task 8 Todo Title 01", isDone: 0.obs)
];
