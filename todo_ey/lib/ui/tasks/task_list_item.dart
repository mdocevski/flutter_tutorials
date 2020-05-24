import 'package:flutter/material.dart';
import 'package:todo_ey/data/task_model.dart';

class TaskListItem extends StatelessWidget {
  final Task task;
  final Function(bool) onChanged;

  const TaskListItem(this.task, this.onChanged);

  @override
  Widget build(BuildContext context) {
    return ListTileTheme(
      contentPadding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 0.0),
      child: CheckboxListTile(
        title: Text(
          task.description,
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
            fontWeight: FontWeight.w500,
            decoration:
                task.done ? TextDecoration.lineThrough : TextDecoration.none,
          ),
        ),
        selected: task.done,
        value: task.done,
        onChanged: onChanged,
      ),
    );
  }
}
