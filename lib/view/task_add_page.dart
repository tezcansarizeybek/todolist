import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/controller/task_controller.dart';

class TaskAddPage extends StatelessWidget {
  TaskAddPage({super.key});

  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Task"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: titleController,
              decoration: const InputDecoration(
                  label: Text("Title"), border: OutlineInputBorder()),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: descController,
              decoration: const InputDecoration(
                  label: Text("Description"), border: OutlineInputBorder()),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                Get.find<TaskController>()
                    .addTask(titleController.text, descController.text);
                Get.back();
              },
              child: Text("Add Task"))
        ],
      ),
    );
  }
}
