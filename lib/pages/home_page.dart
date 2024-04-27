// ignore_for_file: prefer_const_constructors

import 'package:farmer_task_management_app/components/dialog_box.dart';
import 'package:farmer_task_management_app/components/to_do_tile.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 7, 58, 120),
      appBar: AppBar(
        title: Row(
          children: [
            const SizedBox(
              width: 44,
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
        backgroundColor: Colors.blue.shade300,
        elevation: 0,
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.black,
              ),
              accountName: Text("MavokoFarmer"),
              accountEmail: Text("mavokofarm@gmail.com"),
              decoration: BoxDecoration(color: Colors.grey.shade700),
            ),
            ListTile(
              title: Text("All Tasks"),
              leading: Icon(Icons.menu_book_sharp),
              onTap: () => {},
            ),
            ListTile(
              title: Text("All Tasks"),
              leading: Icon(Icons.menu_book_sharp),
              onTap: () => {},
            ),
            ListTile(
              title: Text("All Tasks"),
              leading: Icon(Icons.menu_book_sharp),
              onTap: () => {},
            ),
            ListTile(
              title: Text("All Tasks"),
              leading: Icon(Icons.menu_book_sharp),
              onTap: () => {},
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),
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
