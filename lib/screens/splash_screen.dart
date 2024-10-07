import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:team_tasker/screens/onboarding_page.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Center(
        child: Lottie.asset('assets/animation/Animation-1728200153667.json'),
      ),
      nextScreen: const OnBoardScreen(),
      duration: 4200,
      splashIconSize: 300,
    );
  }
}
