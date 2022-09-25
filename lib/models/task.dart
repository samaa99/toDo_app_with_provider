import 'dart:collection';

import 'package:flutter/foundation.dart';

class Task {
  final String title;
  bool isDone;

  Task({required this.title, this.isDone = false});

  void toggleDone() {
    isDone = !isDone;
  }
}

class Tasks extends ChangeNotifier {
  List<Task> _tasks = [
    Task(title: 'Watch tutorials'),
    Task(title: 'Practice'),
    Task(title: 'Solve the error'),
  ];

  UnmodifiableListView get tasks {
    return UnmodifiableListView(_tasks);
  }

  int get taskCount {
    return _tasks.length;
  }

  void addTask(String title) {
    final task = Task(title: title);
    _tasks.add(task);
    notifyListeners();
  }

  void updateTasks(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void deleteFromTasks(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }
}
