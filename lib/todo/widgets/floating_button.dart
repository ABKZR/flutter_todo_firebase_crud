import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FloatingButton extends StatelessWidget {
 
 final TextEditingController _task = TextEditingController();
 final TextEditingController _description = TextEditingController();
 final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                title: Text('Add Task'),
                content: Column(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _task,
                        decoration: InputDecoration(
                          hintText: 'Tasks'
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        controller: _description,
                        decoration: InputDecoration(
                          hintText: 'description'
                        ),
                      ),
                    ),
                  ],
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      if (_task.text.isNotEmpty) {
                        _firestore.collection('tasks').add({
                          'task': _task.text,
                          'description': _description.text,
                          'createdOn': DateTime.now(),
                        }).then((value) {
                          Navigator.pop(context);
                          _task.clear();
                          print(value.id);
                        }).catchError((error) {
                          print(error);
                        });
                      }
                      //addTask();
                    },
                    child: Text('Add'),
                  )
                ],
              );
            });
      },
      child: Icon(Icons.add),
    );
  }
}
