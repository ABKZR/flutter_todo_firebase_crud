import 'package:flutter/material.dart';
import 'package:flutter_apps/todo/widgets/custom_card.dart';
import 'package:flutter_apps/todo/widgets/floating_button.dart';

class Todo extends StatefulWidget {
  @override
  _TodoState createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  List<String> task = [];
  String _name = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingButton(
        func: function,
        addTask: () {
          setState(() {
            task.add(_name);
          });
        },
      ),
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.5,
        title: Text('Todo App'),
      ),
      body: ListView.builder(
        itemCount: task.length,
        itemBuilder: (context, index) {
          return  CustomCard(
                cardState: () {
                  setState(() {
                    task.removeAt(index);
                  });
                },
                index: index,
                task: task);
        },
      ),
    );
  }
  function(value) => setState(() => _name = value);
}
