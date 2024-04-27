// ignore_for_file: prefer_const_constructors

import 'package:farmer_task_management_app/components/dialog_box.dart';
import 'package:farmer_task_management_app/components/my_bottom_widget.dart';
import 'package:farmer_task_management_app/components/to_do_tile.dart';
import 'package:farmer_task_management_app/pages/all_task_page.dart';
import 'package:farmer_task_management_app/pages/completed_task_page.dart';
import 'package:farmer_task_management_app/pages/uncompleted_task_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();
  //A List of task's to be done
  List toDoList = [
    ["Take the Cows to Graze", true],
    ["Take the Dog to the Vet", false],
    ["Milk the Fresian Cows", false],
  ];

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  void saveNewTask() {
    setState(() {
      toDoList.add([_controller.text, false]);
      _controller.clear();
      Navigator.of(context).pop();
    });
  }

//Create new task
  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  void deleteTask(int index) {
    setState(() {
      toDoList.removeAt(index);
    });
  }

  List<Map<String, dynamic>> getCompletedTasks() {
    return toDoList.where((task) => task[1]).map((task) {
      return {"taskName": task[0], "taskCompleted": task[1]};
    }).toList();
  }

  List<Map<String, dynamic>> getUncompletedTasks() {
    return toDoList.where((task) => !task[1]).map((task) {
      return {"taskName": task[0], "taskCompleted": task[1]};
    }).toList();
  }

  List<Map<String, dynamic>> getAllTasks() {
    return List<Map<String, dynamic>>.from(
      toDoList.map((task) {
        return {"taskName": task[0], "taskCompleted": task[1]};
      }),
    );
  }

  // ignore: unused_field
  int _selectedIndex = 0;

  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MyBottomNavBar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
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
      drawer: Drawer(
        backgroundColor: Colors.green.shade400,
        elevation: 0,
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.grey.shade200,
              ),
              accountName: Text(
                "MavokoFarmer",
                style: TextStyle(color: Colors.black),
              ),
              accountEmail: Text("mavokofarm@gmail.com",
                  style: TextStyle(color: Colors.black)),
              decoration: BoxDecoration(color: Colors.transparent),
            ),
            ListTile(
              title: Text("All Tasks"),
              leading: Icon(
                Icons.menu_book_sharp,
                color: Colors.black54,
              ),
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AllTaskPage(
                      allTasks: getAllTasks(),
                    ),
                  ),
                ),
              },
            ),
            ListTile(
              title: Text("Completed Task"),
              leading: Icon(Icons.check_box, color: Colors.black54),
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CompletedTaskPage(
                      completedTasks: getCompletedTasks(),
                    ),
                  ),
                )
              },
            ),
            ListTile(
              title: Text("Uncompleted Tasks"),
              leading: Icon(Icons.note_alt, color: Colors.black54),
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UncompletedTaskPage(
                      uncompletedTasks: getCompletedTasks(),
                    ),
                  ),
                )
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green.shade300,
        onPressed: createNewTask,
        child: Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskName: toDoList[index][0],
            taskCompleted: toDoList[index][1],
            onchanged: (value) => checkBoxChanged(value, index),
            deleteFunction: (context) => deleteTask(index),
          );
        },
      ),
    );
  }
}
