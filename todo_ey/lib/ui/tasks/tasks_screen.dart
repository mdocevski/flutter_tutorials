import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_ey/ui/tasks/task_list.dart';
import 'package:todo_ey/ui/tasks/tasks_model.dart';

import '../constants.dart';
import 'add_task_sheet.dart';

class TasksScreen extends StatelessWidget {
  static const ID = "tasks";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            shape: kBottomSheetShape,
            isScrollControlled: true,
            builder: (context) => AddTaskBottomSheet(),
          );
        },
      ),
      backgroundColor: Colors.lightBlueAccent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(
              top: 96.0,
              bottom: 32.0,
              left: 32.0,
              right: 32.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CircleAvatar(
                  child: Icon(
                    Icons.list,
                    size: 40.0,
                    color: Colors.lightBlueAccent,
                  ),
                  radius: 32.0,
                  backgroundColor: Colors.white,
                ),
                SizedBox(height: 24.0),
                Text(
                  'Todoey',
                  style: TextStyle(
                    fontSize: 48.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 4.0),
                TasksCounter(),
              ],
            ),
          ),
          SizedBox(height: 40.0),
          Expanded(
            child: Container(
              child: TasksList(),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TasksCounter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TasksModel>(
      builder: (context, tasksData, child) => Text(
        '${tasksData.taskCount == 0 ? "No" : tasksData.taskCount} tasks',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20.0,
        ),
      ),
    );
  }
}
