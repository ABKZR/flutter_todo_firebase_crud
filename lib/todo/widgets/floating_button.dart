import 'package:flutter/material.dart';
import 'package:flutter_apps/todo/widgets/custom_showDialog.dart';

// ignore: must_be_immutable
class FloatingButton extends StatelessWidget {
  final TextEditingController task = TextEditingController();
  final TextEditingController description = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        CustomShowDialog(context, task, description, '', 'Add Task', 'Add');
      },
      child: Icon(Icons.add),
    );
  }
}
