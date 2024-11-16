import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/controller/task_controller.dart';
import 'package:todoapp/view/task_add_page.dart';
import 'package:todoapp/view/widgets/task_widget.dart';

class ListPage extends StatelessWidget {
  const ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("To-Do List"),
      ),
      body: Column(
        children: [
          Expanded(
              child: Obx(
            () => ListView.builder(
              itemBuilder: (context, index) => TaskWidget(
                  task: Get.find<TaskController>().taskList[index],
                  index: index),
              itemCount: Get.find<TaskController>().taskList.length,
            ),
          ))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Get.to(() => TaskAddPage());
        },
      ),
    );
  }
}
