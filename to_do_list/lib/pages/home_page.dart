import 'package:flutter/material.dart';
import 'package:to_do_list/utils/todo_list.dart';

class HomePage extends StatefulWidget{
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _controller = TextEditingController();
  List toDoList = [
    ['Learn Mobile Development', false],
    ['Sarapan', false],
  ];

  void checkBoxChaged(int index){
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  void saveNewTask(){
    setState(() {
      toDoList.add([_controller.text, false]);
      _controller.clear();
    });
  }

  void deleteTask(int index){
    setState(() {
      toDoList.remove(index);
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade300,
      appBar: AppBar(
        title: const Text('Simple Todo',
        ),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: toDoList.length, 
        itemBuilder: (BuildContext context, index){
        return TodoList(
          taskName: toDoList[index][0],
          taskCompleted: toDoList[index][1],
          onChanged: (value) => checkBoxChaged(index),
          deleteFunction: (context) => deleteTask(index),
        );
      },
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20
                ),
                child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    hintText: 'Add new todo items',
                    filled: true,
                    fillColor: Colors.deepPurple.shade200,
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.deepPurple,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.deepPurple,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              )
            ),
            FloatingActionButton(
              onPressed: saveNewTask,
              child: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}