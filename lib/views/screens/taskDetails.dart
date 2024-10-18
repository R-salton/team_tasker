import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TaskDetails extends StatelessWidget {
  static String id = 'taskDetails';
  PageController controller;
  TaskDetails({
    required this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: SafeArea(
        child: Container(
          child: Center(
            child: Column(
              children: [
                Container(
                  margin:
                      EdgeInsets.symmetric(horizontal: 25.w, vertical: 15.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          controller.previousPage(
                            duration: Duration(milliseconds: 200),
                            curve: Curves.easeIn,
                          );
                        },
                        child: Icon(Icons.arrow_back_ios),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    controller.previousPage(
                      duration: Duration(milliseconds: 200),
                      curve: Curves.easeIn,
                    );
                   
                  },
                  child: Text('Task Details'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
