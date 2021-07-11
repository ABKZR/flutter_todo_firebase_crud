import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore _firestore = FirebaseFirestore.instance;
Future addTask(String task, String description) async {
  _firestore.collection('tasks').add({
    'task': task,
    'description': description,
    'createdOn': DateTime.now(),
  }).catchError((error) {
    print(error);
  });
}

Future updateTask(String task, String description, var snapshotData) async {
  await _firestore.collection('tasks').doc(snapshotData.id).update({
    'task': task,
    'description': description,
    'createdOn': DateTime.now(),
  }).catchError((onError) {
    print(onError);
  });
}

Future deleteTask(var snapshotData) async {
  await _firestore.collection('tasks').doc(snapshotData.id).delete();
}
