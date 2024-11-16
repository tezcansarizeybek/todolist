import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/controller/task_controller.dart';
import 'package:todoapp/model/task_model.dart';

class TaskWidget extends StatelessWidget {
  TaskWidget({super.key, required this.task, required this.index});

  TaskModel task;
  int index;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: task.isFinished ? Colors.redAccent.shade100 : null,
      title: Text(
        task.title,
        style: task.isFinished
            ? TextStyle(decoration: TextDecoration.lineThrough)
            : null,
      ),
      subtitle: Text(task.desc,
          style: task.isFinished
              ? TextStyle(decoration: TextDecoration.lineThrough)
              : null),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
              onPressed: () {
                Get.find<TaskController>().toggleTask(index);
              },
              icon: task.isFinished
                  ? Icon(Icons.check_box)
                  : Icon(Icons.check_box_outline_blank)),
          IconButton(
              onPressed: () {
                Get.find<TaskController>().deleteTask(index);
              },
              icon: Icon(Icons.delete))
        ],
      ),
    );
  }
}
