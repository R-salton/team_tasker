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
  final controller;
  final hint;
  bool obsecure = false;
  MyTextField(
      {super.key,
      required this.obsecure,
      required this.controller,
      required this.hint});

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(
          color: kSecondaryColor, fontSize: 18, fontWeight: FontWeight.w600),
      obscureText: obsecure,
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kWhiteColor, width: 1.5.w),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400, width: 1.5.w),
          ),
          fillColor: kWhiteColor,
          filled: true,
          hintText: hint,
          hintStyle: const TextStyle(color: kLigterText)),
    );
  }
}

// Button

class Mybtn extends StatelessWidget {
  const Mybtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: kSecondaryColor,
      ),
      child: const Center(
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Text(
            'LOGIN',
            style: TextStyle(
                color: kPrimaryColor,
                fontSize: 18,
                fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }
}
