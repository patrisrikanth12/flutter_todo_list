import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/widgets/update_task_input.dart';

import '../providers/tasks_provider.dart';

class TaskListItem extends StatefulWidget {
  const TaskListItem({super.key});

  @override
  State<TaskListItem> createState() => _TaskListItemState();
}

class _TaskListItemState extends State<TaskListItem> {
  void changeHandler(Task task, bool taskState) {
    task.setTaskStateTo(taskState);
  }

  Color getBgColor(TaskPriority priority) {
    if (priority == TaskPriority.Low) {
      return Colors.green[100]!;
    } else if (priority == TaskPriority.Medium) {
      return Colors.orange[100]!;
    } else {
      return Colors.red[100]!;
    }
  }

  Color getTextColor(TaskPriority priority) {
    if (priority == TaskPriority.Low) {
      return Colors.green;
    } else if (priority == TaskPriority.Medium) {
      return Colors.orange;
    } else {
      return Colors.red;
    }
  }

  String getPriorityText(TaskPriority priority) {
    if (priority == TaskPriority.Low) {
      return "Low";
    } else if (priority == TaskPriority.Medium) {
      return "Medium";
    } else {
      return "High";
    }
  }

  void editBtnHandler(BuildContext context, String taskId) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext ctx) => UpdateTaskInput(taskId));
  }

  @override
  Widget build(BuildContext context) {
    final task = Provider.of<Task>(context);
    return Card(
      elevation: 2.0,
      child: ListTile(
        leading: Checkbox(
          value: task.isCompleted,
          onChanged: (value) => changeHandler(task, value!),
        ),
        title: Text(
          task.title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            decoration: task.isCompleted
                ? TextDecoration.lineThrough
                : TextDecoration.none,
          ),
        ),
        subtitle: Text(
          getPriorityText(task.priority),
          style: TextStyle(
            color: getTextColor(task.priority),
            fontSize: 12.0,
            // backgroundColor: getBgColor(task.priority),
          ),
        ),
        trailing: IconButton(
          icon: const Icon(Icons.edit),
          onPressed: (() {
            editBtnHandler(context, task.id);
          }),
        ),
      ),
    );
  }
}
