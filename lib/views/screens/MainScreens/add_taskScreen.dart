import 'package:flutter/material.dart';
import 'package:team_tasker/views/components/CustomAppBar.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});
  static String id = 'addTask';

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      appBar: CustomAppBar(),
      body: SafeArea(
        child: Center(
          child: Text("Add Task Screen"),
        ),
      ),
    );
  }
}
