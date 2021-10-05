import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/demo.dart';
import 'package:todo_app/models/task_model.dart';
import 'package:todo_app/models/todo_model.dart';
import 'Constants.dart';

class TaskCard extends StatelessWidget {
  final Function() onPressed;
  final Task task;
  final bool selected;
  const TaskCard({
    required this.onPressed,
    this.selected = false,
    required this.task,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: selected
                ? Theme.of(context).primaryColor
                : Colors.white.withOpacity(0.8),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                offset: const Offset(4, 4),
                blurRadius: 5,
                color: Colors.black.withOpacity(0.2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: Text(task.title, style: kTitleText),
              ),
              Flexible(
                child: Text(
                  task.description,
                  style: kSubTitleText,
                ),
              ),
              Flexible(
                child: ListView.builder(
                  controller: ScrollController(),
                  shrinkWrap: true,
                  itemCount: getTodos(task).length,
                  itemBuilder: (context, index) {
                    final Todo _ctodo = getTodos(task)[index];
                    return Row(
                      children: [
                        Obx(
                          () => Checkbox(
                            value: _ctodo.isDone == 1,
                            onChanged: (vale) {
                              if (vale!) {
                                _ctodo.isDone.value = 1;
                              } else {
                                _ctodo.isDone.value = 0;
                              }
                            },
                          ),
                        ),
                        Text(
                          _ctodo.title,
                          style: kSubTitleText,
                        )
                      ],
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  List<Todo> getTodos(Task task) {
    List<Todo> _todo = [];
    for (var item in todos) {
      if (item.taskId == task.id) {
        _todo.add(item);
      }
    }
    return _todo;
  }
}
