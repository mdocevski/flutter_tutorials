import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_ey/ui/tasks/tasks_model.dart';
import 'package:todo_ey/ui/tasks/tasks_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TasksModel(),
      child: MaterialApp(
        initialRoute: TasksScreen.ID,
        routes: {
          TasksScreen.ID: (context) => TasksScreen(),
        },
      ),
    );
  }
}
