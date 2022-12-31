import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/tasks_provider.dart';

class UpdateTaskInput extends StatefulWidget {
  String taskId;

  UpdateTaskInput(this.taskId);

  @override
  State<UpdateTaskInput> createState() => _UpdateTaskInputState();
}

class _UpdateTaskInputState extends State<UpdateTaskInput> {
  final GlobalKey<FormState> key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    TasksProvider tasksProvider =
        Provider.of<TasksProvider>(context, listen: false);

    Task task = tasksProvider.tasks.firstWhere((task) {
      return task.id == widget.taskId;
    });

    String title = task.title;
    TaskPriority selectedPriority = task.priority;

    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: key,
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                labelText: "Task",
                border: OutlineInputBorder(),
              ),
              initialValue: title,
              validator: ((value) {
                if (value?.isEmpty ?? true) {
                  return "Title cannot be empty";
                }
                return null;
              }),
              onSaved: (newValue) {
                title = newValue!;
              },
            ),
            const SizedBox(
              height: 30.0,
            ),
            Text(
              "Priority",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Column(
              children: [
                ListTile(
                  leading: Radio(
                    value: TaskPriority.Low,
                    groupValue: selectedPriority,
                    onChanged: ((value) {
                      setState(() {
                        task.updateTask(priority: value);
                      });
                    }),
                  ),
                  title: Text(
                    "Low",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                ListTile(
                  leading: Radio(
                    value: TaskPriority.Medium,
                    groupValue: selectedPriority,
                    onChanged: ((value) {
                      setState(() {
                        task.updateTask(priority: value);
                      });
                    }),
                  ),
                  title: Text(
                    "Medium",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                ListTile(
                  leading: Radio(
                    value: TaskPriority.High,
                    groupValue: selectedPriority,
                    onChanged: ((value) {
                      setState(() {
                        task.updateTask(priority: value);
                      });
                    }),
                  ),
                  title: Text(
                    "High",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (key.currentState?.validate() == true) {
                      key.currentState?.save();
                      task.updateTask(
                        id: DateTime.now().toString(),
                        title: title,
                        priority: selectedPriority,
                      );
                      Navigator.of(context).pop();
                    }
                  },
                  child: const Text("Update Task"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
