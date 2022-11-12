import 'package:flutter/material.dart';
import 'screens/home.dart';
import 'screens/add_task_details.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Todorkel",
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}