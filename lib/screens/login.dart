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
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SafeArea(
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Icon(
              Icons.lock,
              size: 100,
              color: kSecondaryColor,
            ),
            SizedBox(
              height: 20.h,
            ),
            const Text(
              'Welcome back you\'ve been missed!',
              style: kMiniHeadingStyle,
            ),
            SizedBox(
              height: 35.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              child: MyTextField(
                controller: _emailController,
                hint: "Username",
                obsecure: false,
              ),
            ),
            SizedBox(height: 15.h),
            Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 25.w,
                ),
                child: MyTextField(
                  controller: _passwordController,
                  hint: "Password",
                  obsecure: true,
                )),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Forgotten password?',
                    style: TextStyle(color: kLigterText, fontSize: 16),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              child: const Mybtn(),
            ),
            SizedBox(
              height: 25.h,
            ),
            Divider(
              indent: 25.w,
              thickness: 2.h,
              endIndent: 25.w,
            ),
            const Text('Or continue with', style: kMiniHeadingStyle)
          ]),
        ),
      ),
    );
  }
}
