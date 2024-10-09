import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:team_tasker/controller/auth_controller.dart';
import 'package:team_tasker/views/components/widgets.dart';
import 'package:team_tasker/views/constants/constants.dart';
import 'package:team_tasker/views/screens/register_screen.dart';

class Login extends StatefulWidget {
  const Login({super.key});
  static String id = "login";

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final AuthController _signInWithGoogle = AuthController();
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
                Icons.lock,
                size: 100,
                color: kSecondaryColor,
              ),
              SizedBox(
                height: 30.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.w),
                child: const Text(
                  'Welcome back you\'ve been missed!',
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

              // Forgotten Button

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
                height: 25.h,
              ),

              // Login Button

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.w),
                child: Mybtn(
                  title: "Sign in",
                  onTap: () {},
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
                    child: GestureDetector(
                      onTap: () async {
                        try {
                          _signInWithGoogle.signIn();
                          print("Successfull signup");
                        } catch (e) {
                          print(e);
                        }
                      },
                      child: Image(
                        height: 40.h,
                        image: const AssetImage('assets/images/google.png'),
                      ),
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
                    'Don\'t have an account? ',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, RegisterScreen.id);
                    },
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                          color: kLightBlue,
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
