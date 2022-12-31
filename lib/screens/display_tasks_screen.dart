import 'package:flutter/material.dart';
import 'package:todo_list/widgets/new_task_input.dart';

import '../widgets/tasks_list.dart';

class DisplayTasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TodoApp"),
      ),
      body: TasksList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context, builder: (ctx) => NewTaskInput());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
