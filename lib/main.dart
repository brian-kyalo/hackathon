import 'package:farmer_task_management_app/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  //Using hive to locally store data in my app
  //initializiation
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My App",
      theme: ThemeData(
          textTheme: TextTheme(bodyMedium: GoogleFonts.permanentMarker())),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
