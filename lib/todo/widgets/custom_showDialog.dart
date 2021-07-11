import 'package:flutter/material.dart';
import 'package:flutter_apps/todo/firebase.dart';

// ignore: non_constant_identifier_names
Future CustomShowDialog(
    BuildContext context,
    TextEditingController task,
    TextEditingController description,
    snapshotData,
    String text,
    String btnText) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          contentPadding: EdgeInsets.all(10),
          content: Column(
            children: [
              TextField(
                controller: task,
                decoration: InputDecoration(hintText: 'Tasks'),
              ),
              TextField(
                controller: description,
                decoration: InputDecoration(hintText: 'Description'),
              ),
            ],
          ),
          title: Text(text),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          actions: [
            TextButton(
              onPressed: () async {
                if (task.text.isNotEmpty && description.text.isNotEmpty) {
                  btnText == 'Update'
                      ? updateTask(task.text, description.text, snapshotData)
                      : addTask(task.text, description.text);

                  Navigator.pop(context);
                  task.clear();
                  description.clear();
                }
              },
              child: Text(btnText),
            ),
          ],
        );
      });
}
