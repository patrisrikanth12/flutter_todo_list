import 'package:flutter/material.dart';

enum TaskPriority {
  High,
  Medium,
  Low,
}

class Task extends ChangeNotifier {
  String id;
  String title;
  TaskPriority priority;
  Color color;

  Task({
    required this.id,
    required this.title,
    required this.priority,
    required this.color,
  });

  void updateTask({
    String? id,
    String? title,
    TaskPriority? priority,
    Color? color,
  }) {
    this.id = id ?? this.id;
    this.title = title ?? this.title;
    this.priority = priority ?? this.priority;
    this.color = color ?? this.color;
  }
}

class TasksProvider extends ChangeNotifier {
  final List<Task> _tasks = [];

  List<Task> get tasks {
    return [..._tasks];
  }

  List<Task> get lowPriorityTasks {
    return _tasks.where((task) => task.priority == TaskPriority.Low).toList();
  }

  List<Task> get mediumPriorityTasks {
    return _tasks
        .where((task) => task.priority == TaskPriority.Medium)
        .toList();
  }

  List<Task> get highPriorityTasks {
    return _tasks.where((task) => task.priority == TaskPriority.High).toList();
  }

  void addTask(
    String id,
    String title,
    TaskPriority priority,
    Color color,
  ) {
    _tasks.add(Task(
      id: id,
      title: title,
      priority: priority,
      color: color,
    ));
  }

  void removeTask(String id) {
    Task selectedTask = _tasks.firstWhere((task) => task.id == id);
    _tasks.remove(selectedTask);
    notifyListeners();
  }
}
