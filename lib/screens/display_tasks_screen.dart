import 'package:flutter/material.dart';

import '../widgets/tasks_list.dart';

class DisplayTasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TodoApp"),
      ),
      body: TasksList(),
    );
  }
}
