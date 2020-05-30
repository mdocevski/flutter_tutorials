import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_ey/data/task_model.dart';
import 'package:todo_ey/ui/tasks/tasks_model.dart';

class TaskListItem extends StatelessWidget {
  final Task task;
  final int taskIndexInList;

  const TaskListItem(this.task, this.taskIndexInList);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: (){
        context.read<TasksModel>().deleteTask(taskIndexInList);
      },
          child: ListTileTheme(
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
          onChanged: (newValue) {
            context.read<TasksModel>().setTaskDonenes(taskIndexInList, newValue);
          },
        ),
      ),
    );
  }
}
