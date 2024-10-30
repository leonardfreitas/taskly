import 'package:flutter/material.dart';
import 'package:taskly/models/task.dart';
import 'package:uuid/uuid.dart';

class TaskProvider with ChangeNotifier {
  List<Task> tasks = [];
  bool isLoading = false;

  Future<void> listTasks() async {
    isLoading = true;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 1));

    List<Task> data = [
      Task(id: const Uuid().toString(), name: 'Fazer Café 1'),
      Task(id: const Uuid().toString(), name: 'Fazer Café 2'),
      Task(id: const Uuid().toString(), name: 'Fazer Café 3'),
      Task(id: const Uuid().toString(), name: 'Fazer Café 4'),
      Task(id: const Uuid().toString(), name: 'Fazer Café 5'),
    ];

    tasks = [...tasks, ...data];
    isLoading = false;
    notifyListeners();
  }

  Future<void> addTasks(Task task) async {
    isLoading = true;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 1));

    tasks.add(task);
    isLoading = false;
    notifyListeners();
  }
}
