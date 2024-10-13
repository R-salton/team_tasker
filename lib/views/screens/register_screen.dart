import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:team_tasker/controller/auth_controller.dart';
import 'package:team_tasker/views/components/grobal_methods.dart';
import 'package:team_tasker/views/components/widgets.dart';
import 'package:team_tasker/views/constants/constants.dart';
import 'package:team_tasker/views/screens/home.dart';
import 'package:team_tasker/views/screens/login.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  static String id = "RegisterScreen";

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final _authController = AuthController();
  final _formKey = GlobalKey<FormState>();

  final AuthController _auth = AuthController();

  final GrobalMethods _grobalMethods = GrobalMethods();

  @override
  void dispose() {
    // Don't forget to dispose controllers when they are no longer needed
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  String firstName = '';
  String lastName = '';
  String email = '';
  String password = '';
  String confirmPassword = '';
  String errorMessage = '';
  bool isThereAnError = false;

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
                height: 15.h,
              ),
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

              isThereAnError
                  ? Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25.w),
                      child: Text(
                        errorMessage,
                        style: kMiniHeadingStyle,
                      ),
                    )
                  : Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25.w),
                      child: const Text(
                        'Enter your full details',
                        style: kMiniHeadingStyle,
                      ),
                    ),
              SizedBox(
                height: 30.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.w),
                child: MyTextField(
                  onChange: (value) => {
                    setState(() {
                      firstName = value;
                    })
                  },
                  controller: _firstNameController,
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
                  onChange: (value) => {
                    setState(
                      () {
                        lastName = value;
                      },
                    ),
                  },
                  controller: _lastNameController,
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
                  onChange: (value) => {
                    setState(
                      () {
                        email = value;
                      },
                    ),
                  },
                  controller: _emailController,
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
                  onChange: (value) => {
                    setState(() {
                      password = value;
                    })
                  },
                  controller: _passwordController,
                  hint: "Password",
                  obsecure: true,
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
                  onChange: (value) => {
                    setState(() {
                      confirmPassword = value;
                    })
                  },
                  controller: _confirmPasswordController,
                  hint: "Verify Password",
                  obsecure: true,
                ),
              ),

              SizedBox(
                height: 20.w,
              ),
              // Login Button

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.w),
                child: Mybtn(
                  title: "Create account",
                  onTap: () async {
                    // Action S when Clicked
                    try {
                      User? user = await _auth.registerUser(
                        context: context,
                        firstName: firstName,
                        lastName: lastName,
                        email: email,
                        password: password,
                      );
                      if (user != null) {
                        // Clear the form
                        _firstNameController.clear();
                        _lastNameController.clear();
                        _emailController.clear();
                        _passwordController.clear();
                        _confirmPasswordController.clear();
                      }

                      setState(() {
                        firstName = '';
                        lastName = '';
                        email = '';
                        password = '';
                        confirmPassword = '';
                        errorMessage = '';
                      });
                    } catch (e) {
                      if (e is FirebaseAuthException) {
                        switch (e.code) {
                          case 'ERROR_WEAK_PASSWORD':
                            _grobalMethods.AuthError(
                                "Password must be at least 6 characters"
                                    .replaceFirst("Exception:", ""),
                                context);
                            break;

                          case 'ERROR_EMAIL_ALREADY_IN_USE':
                            _grobalMethods.AuthError(
                                "Email is Alredy in use"
                                    .replaceFirst("Exception:", ""),
                                context);
                            break;

                          case 'ERROR_INVALID_EMAIL':
                            _grobalMethods.AuthError(
                                "Invalid email!, verify your email"
                                    .replaceFirst("Exception:", ""),
                                context);
                            break;
                          // Handle other error codes here
                          default:
                            _grobalMethods.AuthError(
                                " ${e.message?.replaceFirst("Exception:", "")}",
                                context);
                        }
                      } else {
                        _grobalMethods.AuthError(
                            e.toString().replaceFirst("Exception:", ""),
                            context);
                      }

                      // setState(() {
                      //   errorMessage = e.toString();
                      // });
                    }
                  },
                ),
              ),
              SizedBox(
                height: 20.h,
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
                height: 20.h,
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
                height: 20.h,
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
