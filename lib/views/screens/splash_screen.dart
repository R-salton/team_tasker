import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:team_tasker/views/screens/onboarding_page.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});
  static String id = "splashScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSplashScreen(
        splash: Center(
          child: Lottie.asset('assets/animation/Animation-1728200153667.json'),
        ),
        nextScreen:  OnBoardScreen(),
        duration: 4200,
        splashIconSize: 300,
      ),
    );
  }
}
