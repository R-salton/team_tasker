import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TaskDetails extends StatelessWidget {
  static String id = 'taskDetails';

  const TaskDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Container(
          child: Center(
            child: Column(children: [
              Text('Task Details'),
            ]),
          ),
        ),
      ),
    );
  }
}
