import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_ey/ui/tasks/task_list_item.dart';
import 'package:todo_ey/ui/tasks/tasks_model.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TasksModel>(
      builder: (context, tasksData, child) => ListView.builder(
        padding: EdgeInsets.symmetric(
          vertical: 24.0,
          horizontal: 32.0,
        ),
        itemCount: tasksData.taskCount,
        itemBuilder: (context, index) {
          return TaskListItem(tasksData.tasks[index], (newValue) {
            context.read<TasksModel>().changeTaskDonenes(index, newValue);
          });
        },
      ),
    );
  }
}
