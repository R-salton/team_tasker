import 'package:flutter/material.dart';
import 'package:team_tasker/views/components/CustomAppBar.dart';

class MyTeamsScreen extends StatefulWidget {
  const MyTeamsScreen({super.key});
  static String id = 'myTeams';
  @override
  State<MyTeamsScreen> createState() => _MyTeamsScreenState();
}

class _MyTeamsScreenState extends State<MyTeamsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: CustomAppBar(),
      body: SafeArea(
        child: Center(
          child: Text('My Teams Screen'),
        ),
      ),
    );
  }
}
