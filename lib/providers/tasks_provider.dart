import 'package:flutter/material.dart';

enum TaskPriority {
  High,
  Medium,
  Low,
}

class Task extends ChangeNotifier {
  String id;
  String title;
  bool isCompleted;
  TaskPriority priority;

  Task({
    required this.id,
    required this.title,
    required this.isCompleted,
    required this.priority,
  });

  void updateTask({
    String? id,
    String? title,
    TaskPriority? priority,
  }) {
    this.id = id ?? this.id;
    this.title = title ?? this.title;
    this.priority = priority ?? this.priority;
    notifyListeners();
  }

  void setTaskStateTo(bool selectedState) {
    isCompleted = selectedState;
    notifyListeners();
  }
}

class TasksProvider extends ChangeNotifier {
  final List<Task> _tasks = [];

  List<Task> get tasks {
    return [..._tasks];
  }

  void addTask({
    required String id,
    required String title,
    required bool isCompleted,
    required TaskPriority priority,
  }) {
    _tasks.add(Task(
      id: id,
      title: title,
      isCompleted: isCompleted,
      priority: priority,
    ));
    notifyListeners();
  }

  void removeTask(String id) {
    Task selectedTask = _tasks.firstWhere((task) => task.id == id);
    _tasks.remove(selectedTask);
    notifyListeners();
  }
}
