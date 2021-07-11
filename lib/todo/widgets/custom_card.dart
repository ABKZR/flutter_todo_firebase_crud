import 'package:flutter/material.dart';
import 'package:flutter_apps/todo/firebase.dart';
import 'package:flutter_apps/todo/widgets/custom_showDialog.dart';

class CustomCard extends StatelessWidget {
  final int index;
  final AsyncSnapshot snapshot;
  CustomCard({required this.index, required this.snapshot});
  @override
  Widget build(BuildContext context) {
    var snapshotData = snapshot.data!.docs[index];

    TextEditingController task =
        TextEditingController(text: snapshotData['task']);
    TextEditingController description =
        TextEditingController(text: snapshotData['description']);
    return Card(
      elevation: 4,
      margin: EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        title: Text(snapshotData['task']),
        leading: CircleAvatar(
          child: Text(snapshotData["task"][0]),
        ),
        subtitle: Text(snapshotData['description']),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () async {
                CustomShowDialog(context, task, description, snapshotData,'Update Task','Update');
              },
              icon: Icon(Icons.edit),
            ),
            IconButton(
              onPressed: () async {
                deleteTask(snapshotData);
              },
              icon: Icon(
                Icons.delete,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}