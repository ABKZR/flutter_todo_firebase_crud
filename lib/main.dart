import 'package:flutter/material.dart';
import 'package:flutter_apps/main_screen/screens.dart';
import 'package:flutter_apps/todo/HomePage.dart';
import 'package:flutter_apps/todo/model/data_model.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  final document = await getApplicationDocumentsDirectory();
  Hive.init(document.path);
  Hive.registerAdapter(DataModelAdapter());
  await Hive.openBox<DataModel>(dataBoxName);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}
