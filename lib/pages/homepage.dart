import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/demo.dart';
import 'package:todo_app/misc/widgets.dart';
import 'package:todo_app/models/taskModel.dart';

class HomePage extends GetView {
  List<Task> _items = tasks;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
          child: ReorderableListView.builder(
        itemBuilder: (context, index) {
          return Container(
            key: ValueKey(index),
            child: ECommerceItem(
              title: _items[index].title,
              onPressed: () {},
            ),
          );
        },
        itemCount: tasks.length,
        onReorder: (int oldIndex, int newIndex) {
          if (oldIndex < newIndex) {
            newIndex -= 1;
          }
          final item = _items.removeAt(oldIndex);
          _items.insert(newIndex, item);
        },
      )),
    ));
  }
}
