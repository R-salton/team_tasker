import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';
import 'package:team_tasker/views/components/CustomAppBar.dart';
import 'package:team_tasker/views/components/Task_tile.dart';
// import 'package:team_tasker/views/components/grobal_methods.dart';
// import 'package:team_tasker/views/screens/MainScreens/Home.dart';
// import 'package:team_tasker/views/screens/taskDetails.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});
  static String id = 'taskScreen';

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  // final GlobalMethods _globalMethods = GlobalMethods();
  // final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(),
        body: SafeArea(
          child: SingleChildScrollView(
              child: Column(
            children: [
              SizedBox(height: 20.h),
              Center(
                child: Container(
                  decoration: BoxDecoration(),
                  height: 50,
                  child: Text("My Tasks"),
                ),
              ),
              SizedBox(height: 20),
              ResponsiveGridList(
                horizontalGridSpacing:
                    16, // Horizontal space between grid items
                verticalGridSpacing: 16, // Vertical space between grid items
                horizontalGridMargin: 50, // Horizontal space around the grid
                verticalGridMargin: 50, // Vertical space around the grid
                minItemWidth:
                    300, // The minimum item width (can be smaller, if the layout constraints are smaller)
                minItemsPerRow:
                    2, // The minimum items to show in a single row. Takes precedence over minItemWidth
                maxItemsPerRow:
                    5, // The maximum items to show in a single row. Can be useful on large screens
                listViewBuilderOptions:
                    ListViewBuilderOptions(), // Options that are getting passed to the ListView.builder() function
                children: [
                  TaskTile(),
                  Text('Hello'),
                  Text('Hello'),
                  Text('Hello'),
                ], // The list of widgets in the list
              )
            ],
          )),
        ));
  }
}
