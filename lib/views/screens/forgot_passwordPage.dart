import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:team_tasker/controller/auth_controller.dart';
import 'package:team_tasker/views/components/grobal_methods.dart';
import 'package:team_tasker/views/components/widgets.dart';
import 'package:team_tasker/views/constants/constants.dart';

class ForgotPassworsPage extends StatefulWidget {
  const ForgotPassworsPage({super.key});
  static String id = 'forgotPassword';

  @override
  State<ForgotPassworsPage> createState() => _ForgotPassworsPageState();
}

class _ForgotPassworsPageState extends State<ForgotPassworsPage> {
  final TextEditingController _emalTextController = TextEditingController();
  final AuthController _auth = AuthController();
  final GrobalMethods _grobalMethods = GrobalMethods();
  String _email = '';

  @override
  void dispose() {
    // TODO: implement dispose
    _emalTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, //change your color
        ),
        centerTitle: true,
        title: const Text(
          'Reset  Password',
          style: TextStyle(
              color: kWhiteColor, fontSize: 20, fontWeight: FontWeight.w700),
        ),
        backgroundColor: kSecondaryColor,
        elevation: 0,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.h),
                child: Text(
                  textAlign: TextAlign.center,
                  'Enter email to receive password reset link',
                  style: TextStyle(
                      color: kSecondaryColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(height: 25.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.h),
                child: MyTextField(
                    obsecure: false,
                    controller: _emalTextController,
                    hint: "Email",
                    onChange: (value) {
                      setState(() {
                        _email = value;
                        print(_email);
                      });
                    }),
              ),
              SizedBox(
                height: 25.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.h),
                child: Mybtn(
                    title: "Reset Password",
                    onTap: () async {
                      try {
                        await _auth.resePassword(_email.trim());
                        _grobalMethods.success(
                            "Password reset link was sent to $_email",
                            "Email Sent successfully!",
                            context);
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'user-not-found') {
                          _grobalMethods.AuthError(
                              "No user with this email found, try again!",
                              context);
                        } else {
                          // Handle other errors here
                          _grobalMethods.AuthError(
                              "An error occurred. Please try again.", context);
                        }
                      }
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
