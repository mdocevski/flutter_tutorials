import 'package:flutter/foundation.dart';

class Task {
  final String description;
  final bool done;

  const Task({
    @required this.description,
    @required this.done,
  });

  Task copyWith({
    String description,
    bool done,
  }) =>
      Task(
        description: description ?? this.description,
        done: done ?? this.done,
      );
}
