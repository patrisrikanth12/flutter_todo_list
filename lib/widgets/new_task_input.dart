import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/providers/tasks_provider.dart';

class NewTaskInput extends StatefulWidget {
  @override
  State<NewTaskInput> createState() => _NewTaskInputState();
}

class _NewTaskInputState extends State<NewTaskInput> {
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  TaskPriority selectedPriority = TaskPriority.Low;

  @override
  Widget build(BuildContext context) {
    TasksProvider tasksProvider =
        Provider.of<TasksProvider>(context, listen: false);

    String title = '';

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
                        selectedPriority = value!;
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
                        selectedPriority = value!;
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
                        selectedPriority = value!;
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
                      tasksProvider.addTask(
                        id: DateTime.now().toString(),
                        title: title,
                        isCompleted: false,
                        priority: selectedPriority,
                      );
                      Navigator.of(context).pop();
                    }
                  },
                  child: const Text("Add Task"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
