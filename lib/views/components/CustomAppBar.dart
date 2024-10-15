import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:team_tasker/views/constants/constants.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(100);
}

class _CustomAppBarState extends State<CustomAppBar> {
  User? _currentUser;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
      height: 80.h,
      decoration: BoxDecoration(
          color: kPrimaryColor, borderRadius: BorderRadius.only()),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.menu,
              color: kSecondaryColor,
            ),
            Text(
              'Team Tasker',
              style: TextStyle(
                  color: kSecondaryColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w700),
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(
                    color: kSecondaryColor,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(100)),
              height: 40,
              width: 40,
              child: CircleAvatar(
                child: Text('NS'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
