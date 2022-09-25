import 'package:flutter/material.dart';
import 'package:todoey/wigets/task_tile.dart';
import 'package:todoey/models/task.dart';
import 'package:provider/provider.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Tasks>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            return TaskTile(
              title: taskData.tasks[index].title,
              isChecked: taskData.tasks[index].isDone,
              checkBoxCallBack: (checkBoxState) {
                taskData.updateTasks(taskData.tasks[index]);
              },
              longPressToDelete: () {
                taskData.deleteFromTasks(taskData.tasks[index]);
              },
            );
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}
