import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:team_tasker/controller/auth_controller.dart';
import 'package:team_tasker/views/components/grobal_methods.dart';
import 'package:team_tasker/views/components/widgets.dart';
import 'package:team_tasker/views/constants/constants.dart';
import 'package:team_tasker/views/screens/forgot_passwordPage.dart';
import 'package:team_tasker/views/screens/MainScreen.dart';
import 'package:team_tasker/views/screens/register_screen.dart';

class Login extends StatefulWidget {
  const Login({super.key});
  static String id = "login";

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String email = '';
  String password = '';
  final AuthController _authController = AuthController();
  User? user;

  final GrobalMethods _globalMethods = GrobalMethods();

  @override
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kSecondaryColor,
        title: Text(
          "Team Tasker",
          style: TextStyle(
              color: kWhiteColor, fontSize: 20, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: kWhiteColor),
      ),
      backgroundColor: kPrimaryColor,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              SizedBox(
                height: 15.0,
              ),
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
                  onChange: (value) => {
                    setState(() {
                      email = value;
                    })
                  },
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
                    onChange: (value) => {
                      setState(() {
                        password = value;
                      })
                    },
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () =>
                          Navigator.pushNamed(context, ForgotPassworsPage.id),
                      child: Text(
                        'Forgotten password?',
                        style: TextStyle(
                            color: kLightBlue,
                            fontSize: 18,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),

              // Login Button

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.w),
                child: Mybtn(
                  title: "Sign in",
                  onTap: () async {
                    try {
                      User? user = await _authController.signInUser(
                        context: context,
                        email: email,
                        password: password,
                      );
                    } catch (e) {
                      if (e is FirebaseAuthException) {
                        switch (e.code) {
                          case 'wrong-password':
                            _globalMethods.AuthError(
                                "Wrong Password".replaceFirst('Excepetion', ''),
                                context);
                            break;
                          case 'user-not-found':
                            _globalMethods.AuthError(
                                "User Not Found".replaceFirst('Excepetion', ''),
                                context);
                            break;
                          case 'user-disabled':
                            _globalMethods.AuthError(
                                "User Disabled".replaceFirst('Excepetion', ''),
                                context);
                            break;
                          case 'too-many-requests':
                            _globalMethods.AuthError(
                                "Too Many Requests", context);
                            break;
                          case 'operation-not-allowed':
                            _globalMethods.AuthError(
                                "Operation Not Allowed"
                                    .replaceFirst('Excepetion:', ''),
                                context);
                            break;
                          case 'invalid-email':
                            _globalMethods.AuthError(
                                "Invalid Email".replaceFirst('Excepetion:', ''),
                                context);
                            break;
                          default:
                            _globalMethods.AuthError(
                                "An error occurred", context);
                        }
                      } else {
                        print(e);
                        // Handle non-FirebaseAuth exceptions if needed
                        _globalMethods.AuthError(
                            "$e."
                                .replaceFirst('Exception:', '')
                                .replaceFirst('malformed or has expired.', '')
                                .replaceFirst(', ', ''),
                            context);
                      }
                    }
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
                    child: GestureDetector(
                      onTap: () async {
                        await _authController.googleSign();
                        Navigator.pushNamed(context, Mainscreen.id);
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
