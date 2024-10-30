import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:team_tasker/views/constants/constants.dart';
import 'package:team_tasker/views/screens/taskDetails.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 0.h),
      child: Container(
        height: 80.h,
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(vertical: 2.h),
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 10),
              blurRadius: 30,
              color: kSecondaryColor.withOpacity(.25),
            ),
          ],
        ),
        child: ListTile(
          leading: Image.asset('assets/images/google.png'),
          title: Container(
            child: Text(
              "Project Presentation",
              style: kMiniHeadingStyle,
            ),
          ),
          trailing: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, TaskDetails.id);
            },
            child: Icon(
              Iconsax.arrow_right_1,
              color: kSecondaryColor,
              size: 30,
            ),
          ),
          subtitle: Text('Pending...'),
        ),
      ),
    );
  }
}
