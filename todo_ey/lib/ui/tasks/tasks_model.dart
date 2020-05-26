import 'package:flutter/foundation.dart';
import 'package:todo_ey/data/task_model.dart';

class TasksModel with ChangeNotifier {
  List<Task> tasks = [
    Task(description: 'Buy egs', done: false),
    Task(description: 'Do dishes', done: false),
    Task(description: 'Excercise 15min', done: false),
  ];

  void setTasks(List<Task> newTasks) {
    tasks = newTasks;
    notifyListeners();
  }

  void changeTaskDonenes(int taskIndex, bool newTaskDonenes) {
    tasks[taskIndex] = tasks[taskIndex].copyWith(done: newTaskDonenes);
    notifyListeners();
  }

  void addTask(String taskDescription) {
    tasks.add(Task(description: taskDescription, done: false));
    notifyListeners();
  }

  int get taskCount => tasks.length;
}
