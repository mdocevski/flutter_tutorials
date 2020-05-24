import 'package:flutter/material.dart';
import 'package:todo_ey/data/task_model.dart';
import 'package:todo_ey/ui/tasks/task_list.dart';

import '../constants.dart';
import 'add_task_sheet.dart';

class TasksScreen extends StatefulWidget {
  static const String ID = 'tasks';

  TasksScreen({Key key}) : super(key: key);

  @override
  _TasksScreenState createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
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
                Text(
                  '12 Tasks',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 40.0),
          Expanded(
            child: Container(
              child: TasksList(
                tasks: tasks,
                onChanged: (index, newTaskDonenes) {
                  onTaskCheckChanged(index, newTaskDonenes);
                },
              ),
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

  void onTaskCheckChanged(int taskIndex, bool newTaskDonenes) {
    setState(() {
      tasks[taskIndex] = tasks[taskIndex].copyWith(done: newTaskDonenes);
    });
  }

  List<Task> tasks = [
    Task(description: 'Buy egs', done: false),
    Task(description: 'Do dishes', done: false),
    Task(description: 'Excercise 15min', done: false),
  ];
}
