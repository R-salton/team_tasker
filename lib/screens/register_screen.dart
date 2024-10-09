import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:team_tasker/components/widgets.dart';
import 'package:team_tasker/constants/constants.dart';
import 'package:team_tasker/screens/login.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  static String id = "RegisterScreen";

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Icon(
                Icons.book_online,
                size: 100,
                color: kSecondaryColor,
              ),
              SizedBox(
                height: 30.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.w),
                child: const Text(
                  'Create an Account',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.w),
                child: const Text(
                  'Enter your full details',
                  style: kMiniHeadingStyle,
                ),
              ),
              SizedBox(
                height: 35.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.w),
                child: MyTextField(
                  controller: _emailController,
                  hint: "First name",
                  obsecure: false,
                ),
              ),
              SizedBox(height: 10.h),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 25.w,
                ),
                child: MyTextField(
                  controller: _passwordController,
                  hint: "Last name",
                  obsecure: false,
                ),
              ),

              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 25.w,
                ),
                child: MyTextField(
                  controller: _passwordController,
                  hint: "Email",
                  inputType: TextInputType.emailAddress,
                  obsecure: false,
                ),
              ),

              // Forgotten Button

              SizedBox(
                height: 10.h,
              ),

              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 25.w,
                ),
                child: MyTextField(
                  controller: _passwordController,
                  hint: "Password",
                  obsecure: true,
                ),
              ),

              SizedBox(
                height: 25.w,
              ),
              // Login Button

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.w),
                child: Mybtn(
                  title: "Create account",
                  onTap: () {
                    // Action S when Clicked
                  },
                ),
              ),
              SizedBox(
                height: 25.h,
              ),

              // Continues With
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.w),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 2.h,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25.w),
                      child: const Text('Or continue with',
                          style: kMiniHeadingStyle),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 2.h,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: 25.h,
              ),
              // Google icons and Apple

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: kWhiteColor,
                      border: Border.all(color: kWhiteColor, width: 1.5),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Image(
                      height: 40.h,
                      image: const AssetImage('assets/images/google.png'),
                    ),
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: kWhiteColor,
                      border: Border.all(color: kWhiteColor, width: 1.5),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Image(
                      height: 40.h,
                      image: const AssetImage('assets/images/apple.png'),
                    ),
                  ),
                ],
              )

              // Not a member?
              ,
              SizedBox(
                height: 25.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Have an account? ',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, Login.id);
                    },
                    child: const Text(
                      'Sing In',
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 18,
                          fontWeight: FontWeight.w700),
                    ),
                  )
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }
}
