import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:todo_ey/data/task_model.dart';

class TasksModel with ChangeNotifier {
  List<Task> _tasks = [
    Task(description: 'Buy egs', done: false),
    Task(description: 'Do dishes', done: false),
    Task(description: 'Excercise 15min', done: false),
  ];

  void setTasks(List<Task> newTasks) {
    _tasks = newTasks;
    notifyListeners();
  }

  void setTaskDonenes(int taskIndex, bool newTaskDonenes) {
    _tasks[taskIndex] = _tasks[taskIndex].copyWith(done: newTaskDonenes);
    notifyListeners();
  }

  void addTask(String taskDescription) {
    _tasks.add(Task(description: taskDescription, done: false));
    notifyListeners();
  }

  int get taskCount => _tasks.length;

  UnmodifiableListView<Task> get tasks => UnmodifiableListView(_tasks);

  void deleteTask(int taskIndexInList) {
    _tasks.removeAt(taskIndexInList);
    notifyListeners();
  }
}
