import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todoapp/model/task_model.dart';

class TaskController extends GetxController {
  RxList<TaskModel> taskList = <TaskModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadTasks();
  }

  addTask(String title, String desc) {
    taskList.add(TaskModel(
      title: title,
      desc: desc,
    ));
    saveTasks();
  }

  toggleTask(int index) async {
    taskList.elementAt(index).isFinished =
        !taskList.elementAt(index).isFinished;
    taskList.refresh();
    await saveTasks();
  }

  deleteTask(int index) async {
    taskList.removeAt(index);
    await saveTasks();
  }

  loadTasks() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> taskListJson = prefs.getStringList('tasks') ?? [];
    taskList.assignAll(
        taskListJson.map((e) => TaskModel.fromJson(jsonDecode(e))).toList());
  }

  saveTasks() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> taskListJson =
        taskList.map((e) => jsonEncode(e.toJson())).toList();
    prefs.setStringList('tasks', taskListJson);
  }
}
