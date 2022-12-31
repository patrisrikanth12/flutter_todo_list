import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:todo_list/providers/tasks_provider.dart';
import './task_list_item.dart';

class TasksList extends StatefulWidget {
  const TasksList({super.key});

  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  @override
  Widget build(BuildContext context) {
    final tasksProvider = Provider.of<TasksProvider>(context);
    final tasks = tasksProvider.tasks;
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        return ChangeNotifierProvider.value(
          value: tasks[index],
          child: TaskListItem(),
        );
      },
    );
  }
}
