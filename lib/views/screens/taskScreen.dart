import 'package:flutter/material.dart';
import 'package:team_tasker/views/components/CustomAppBar.dart';
import 'package:team_tasker/views/components/grobal_methods.dart';
import 'package:team_tasker/views/screens/taskDetails.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});
  static String id = 'taskScreen';

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  final GlobalMethods _globalMethods = GlobalMethods();
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: CustomAppBar(),
      body: SafeArea(
          child: PageView(
        controller: _pageController,
        children: [
          Container(
            child: Scaffold(
              body: SafeArea(
                child: Center(
                  child: Column(
                    children: [
                      
                      Center(
                          child: GestureDetector(
                              onTap: () {
                                _pageController.nextPage(
                                    duration: Duration(milliseconds: 300),
                                    curve: Curves.easeIn);
                              },
                              child: Text('Tasks Screen'))),
                    ],
                  ),
                ),
              ),
            ),
          ),
          TaskDetails(
            controller: _pageController,
          ),
        ],
      )),
    );
  }
}
