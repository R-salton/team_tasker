import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:team_tasker/constants/constants.dart';

class OnBoardWidget extends StatelessWidget {
  final Color;
  final String title;
  final String subTitle;
  LottieBuilder images;
  OnBoardWidget(
      {super.key,
      required this.title,
      required this.subTitle,
      this.Color,
      required this.images});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 100.h, left: 30.w, right: 30.w),
      color: Color,
      child: Column(
        children: [
          Center(child: images),
          SizedBox(
            height: 15.h,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text(
                  textAlign: TextAlign.center,
                  title,
                  style: kHeadingStyle,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  textAlign: TextAlign.center,
                  "Introduce users to the app's core purpose, highlighting its focus on teamwork and collaboration.",
                  style: TextStyle(
                    color: kLigterText,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

// TExt Fied

class MyTextField extends StatelessWidget {
  const MyTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: kLigterText),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: kPrimaryColor),
        ),
        // fillColor: Color.fromARGB(255, 80, 80, 80),
        // filled: true,
      ),
    );
  }
}

// Button

class Mybtn extends StatelessWidget {
  const Mybtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kLightBlue,
      child: const Padding(
        
        padding: EdgeInsets.all(15.0),
        child: Text(
          'LOGIN',
          style: TextStyle(
              color: kPrimaryColor, fontSize: 22, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
