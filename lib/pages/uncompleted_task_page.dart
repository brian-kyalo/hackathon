// uncompleted_tasks_screen.dart

import 'package:flutter/material.dart';

class UncompletedTaskPage extends StatelessWidget {
  final List<Map<String, dynamic>> uncompletedTasks;

  UncompletedTaskPage({required this.uncompletedTasks});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Uncompleted Tasks'),
      ),
      body: ListView.builder(
        itemCount: uncompletedTasks.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(uncompletedTasks[index]['taskName']),
            leading: Checkbox(
              value: false,
              onChanged: null, // Disable checkbox
            ),
          );
        },
      ),
    );
  }
}
