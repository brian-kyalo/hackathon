// completed_tasks_screen.dart

import 'package:flutter/material.dart';

class CompletedTaskPage extends StatelessWidget {
  final List<Map<String, dynamic>> completedTasks;

  CompletedTaskPage({required this.completedTasks});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Completed Tasks'),
      ),
      body: ListView.builder(
        itemCount: completedTasks.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(completedTasks[index]['taskName']),
            leading: Checkbox(
              value: true,
              onChanged: null, // Disable checkbox
            ),
          );
        },
      ),
    );
  }
}
