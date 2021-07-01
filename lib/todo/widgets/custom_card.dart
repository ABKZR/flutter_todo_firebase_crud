
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget{
  final int index;
  final List task;
  final Function cardState;
  CustomCard({required this.index,required this.task,required this.cardState});
  @override
  Widget build(BuildContext context) {
    return
      Dismissible(
        key: Key(task[index]),
      child: Card(
      elevation: 4,
      margin: EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        title: Text(task[index]),
        trailing: IconButton(
          onPressed: () {
            cardState();
          },
          icon: Icon(
            Icons.delete,
            color: Colors.red,
          ),
        ),
      ),
    ),
      );
  }
}
