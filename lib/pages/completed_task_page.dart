// completed_tasks_screen.dart

import 'package:flutter/material.dart';

class CompletedTaskPage extends StatelessWidget {
  final List<Map<String, dynamic>> completedTasks;

  CompletedTaskPage({required this.completedTasks});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 5, 35, 12),
      appBar: AppBar(
        title: Row(
          children: [
            const SizedBox(
              width: 140,
            ),
            Text(
              "Farm",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w700,
              ),
            ),
            Icon(
              Icons.agriculture_outlined,
              size: 60,
              color: Colors.green.shade900,
            ),
            Text(
              "Task",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.w700),
            ),
          ],
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 80.0, left: 160),
        child: ListView.builder(
          itemCount: completedTasks.length,
          itemBuilder: (context, index) {
            return ListTile(
              textColor: Colors.white,
              title: Text(completedTasks[index]['taskName']),
              leading: Checkbox(
                value: true,
                onChanged: null, // Disable checkbox
              ),
            );
          },
        ),
      ),
    );
  }
}
