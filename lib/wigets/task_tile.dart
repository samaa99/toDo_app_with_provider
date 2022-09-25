import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String title;
  final Function checkBoxCallBack;
  final Function longPressToDelete;

  TaskTile({
    required this.title,
    required this.isChecked,
    required this.checkBoxCallBack,
    required this.longPressToDelete,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: () {
        longPressToDelete();
      },
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          decoration: isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        activeColor: Colors.deepOrange,
        value: isChecked,
        onChanged: (newValue) {
          checkBoxCallBack(newValue);
        },
      ),
    );
  }
}
