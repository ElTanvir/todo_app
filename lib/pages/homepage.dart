import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:reorderables/reorderables.dart';
import 'package:todo_app/demo.dart';
import 'package:todo_app/misc/widgets.dart';

import 'package:todo_app/models/task_model.dart';

class HomePage extends GetView {
  RxList<Task> _items = tasks.obs;
  final SlidableController slidableController = SlidableController();
  final ScrollController reorder = ScrollController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx(
          () => Container(
            height: MediaQuery.of(context).size.height,
            child: ReorderableColumn(
              scrollController: reorder,
              mainAxisSize: MainAxisSize.min,
              onReorder: (int oldIndex, int newIndex) {
                final Task _task = _items.removeAt(oldIndex);
                _items.insert(newIndex, _task);
              },
              children: List<Widget>.generate(
                _items.length,
                (index) => Slidable(
                  controller: slidableController,
                  actionPane: const SlidableDrawerActionPane(),
                  actions: [
                    IconSlideAction(
                      caption: 'Delete',
                      color: Colors.red,
                      icon: Icons.delete,
                      onTap: () {
                        _items.removeAt(index);
                      },
                    ),
                  ],
                  dismissal: SlidableDismissal(
                    dismissThresholds: const <SlideActionType, double>{
                      SlideActionType.primary: 0.4
                    },
                    child: const SlidableDrawerDismissal(),
                    onDismissed: (action) {
                      _items.removeAt(index);
                    },
                  ),
                  key: ValueKey(index),
                  child: TaskCard(
                    onPressed: () {},
                    task: _items[index],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
