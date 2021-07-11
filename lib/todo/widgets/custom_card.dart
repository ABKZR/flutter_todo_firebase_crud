import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final int index;
  final AsyncSnapshot snapshot;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  CustomCard({required this.index, required this.snapshot});
  @override
  Widget build(BuildContext context) {
    var snapshotData = snapshot.data!.docs[index];
    
  TextEditingController _task = TextEditingController(text: snapshotData['task']);
  TextEditingController _description = TextEditingController(text: snapshotData['description']);
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
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        contentPadding: EdgeInsets.all(10),
                        content: Column(
                          children: [
                            TextField(
                              controller: _task,
                              decoration: InputDecoration(hintText: 'Tasks'),
                            ),
                            TextField(
                              controller: _description,
                              decoration:
                                  InputDecoration(hintText: 'Description'),
                            ),
                          ],
                        ),
                        title: Text('Update Task'),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        actions: [
                          TextButton(
                            onPressed: () async {
                              if (_task.text.isNotEmpty &&
                                  _description.text.isNotEmpty) {
                                await _firestore
                                    .collection('tasks')
                                    .doc(snapshotData.id)
                                    .update({
                                      'task':_task.text,
                                      'description':_description.text,
                                      'createdOn': DateTime.now(),
                                    }).then((value) {
                                      Navigator.pop(context);
                                      _task.clear();
                                      _description.clear();
                                    }).catchError((onError){
                                      print(onError);
                                    });
                              }
                            },
                            child: Text('Update Task'),
                          ),
                        ],
                      );
                    });
              },
              icon: Icon(Icons.edit),
            ),
            IconButton(
              onPressed: () async {
                await _firestore
                    .collection('tasks')
                    .doc(snapshotData.id)
                    .delete();
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
