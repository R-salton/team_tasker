import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:team_tasker/constants/constants.dart';
import 'package:team_tasker/screens/splash_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      child: MaterialApp(
        theme: ThemeData(
          fontFamily: 'ProximaNova',
          primaryColor: kPrimaryColor,
        ),
        debugShowCheckedModeBanner: false,
        title: 'Team Tasker',
        home: const Scaffold(backgroundColor: kPrimaryColor, body: Splash()),
      ),
    );
  }
}