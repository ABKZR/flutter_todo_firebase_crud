import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_apps/todo/widgets/custom_card.dart';
import 'package:flutter_apps/todo/widgets/floating_button.dart';

class Todo extends StatelessWidget {
  var _firestore = FirebaseFirestore.instance.collection('tasks').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingButton(),
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.5,
        title: Text('Todo App'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _firestore,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              return CustomCard(index: index, snapshot: snapshot);
            },
          );
        },
      ),
    );
  }
}
