import 'package:farmer_task_management_app/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  //Using hive to locally store data in my app
  //initializiation
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "My App",
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
