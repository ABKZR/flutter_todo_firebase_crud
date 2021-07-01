import 'package:flutter/material.dart';

class FloatingButton extends StatelessWidget {
  FloatingButton({Key? key, required this.addTask, required this.func})
      : super(key: key);
  final Function addTask;
  String callback ="";
  final Function func;
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
                content: TextField(
                  onChanged: (value) {
                    func( value);
                  },
                ),
                actions: [
                  TextButton(
                    onPressed: () {

                      addTask();
                      Navigator.pop(context);
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
