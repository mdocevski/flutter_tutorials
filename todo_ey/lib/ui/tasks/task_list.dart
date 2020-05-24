import 'package:flutter/material.dart';
import 'package:todo_ey/data/task_model.dart';
import 'package:todo_ey/ui/tasks/task_list_item.dart';

class TasksList extends StatelessWidget {
  final List<Task> tasks;
  final Function(int, bool) onChanged;

  const TasksList({
    @required this.tasks,
    @required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(
        vertical: 24.0,
        horizontal: 20.0,
      ),
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        var task = tasks[index];
        return TaskListItem(
          task,
          (newValue) {
            onChanged(index, newValue);
          },
        );
      },
    );
  }
}
