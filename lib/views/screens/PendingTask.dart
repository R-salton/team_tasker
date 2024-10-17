import 'package:flutter/material.dart';
import 'package:team_tasker/views/components/widgets.dart';

class PendingTaskScreen extends StatefulWidget {
  const PendingTaskScreen({super.key});
  static String id = 'pendingTasks';

  @override
  State<PendingTaskScreen> createState() => Pending_TaskStateScreen();
}

class Pending_TaskStateScreen extends State<PendingTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppBar(title: "Pending Tasks") ,
      body: SafeArea(
          child: Center(
        child: Text('Pending Tasks Screen'),
      )),
    );
  }
}
