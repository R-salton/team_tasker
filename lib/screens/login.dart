import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:team_tasker/components/widgets.dart';
import 'package:team_tasker/constants/constants.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kSecondaryColor,
        body: SafeArea(
            child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Icon(
              Icons.lock,
              size: 100,
              color: kPrimaryColor,
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              child: const MyTextField(),
            ),
            SizedBox(height: 15.h),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 25.w,
              ),
              child: const MyTextField(),
            ),
            SizedBox(height: 25.h),
            const Mybtn()
          ]),
        )));
  }
}
