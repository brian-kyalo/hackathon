import 'package:flutter/material.dart';

class AllTaskPage extends StatelessWidget {
  final List<Map<String, dynamic>> allTasks;

  const AllTaskPage({super.key, required this.allTasks});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Tasks'),
      ),
      body: ListView.builder(
        itemCount: allTasks.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(allTasks[index]['taskName']),
            leading: Checkbox(
              value: allTasks[index]['taskCompleted'],
              onChanged: null, // Disable checkbox
            ),
          );
        },
      ),
    );
  }
}
