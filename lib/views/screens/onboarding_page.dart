import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:team_tasker/controller/auth_controller.dart';
import 'package:team_tasker/views/components/widgets.dart';
import 'package:team_tasker/views/constants/constants.dart';
import 'package:team_tasker/views/screens/MainScreen.dart';
import 'package:team_tasker/views/screens/login.dart';

class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({super.key});
  static String id = "onboarding";

  @override
  State<OnBoardScreen> createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  final PageController _controller = PageController();
  @override
  _OnBoardScreenState createState() => _OnBoardScreenState();

  final AuthController _authController = AuthController();

  User? currentUser;
  bool onLastPage = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkCurrentUser();
  }

  void checkCurrentUser() async {
    currentUser = await _authController.getCurrentUser();

    // if (currentUser != null) {
    //   Navigator.pushNamed(context, Home.id);
    // } else {
    //   Navigator.pushNamed(context, Login.id);
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          child: Stack(
            children: [
              PageView(
                onPageChanged: (value) {
                  setState(() {
                    onLastPage = (value == 3);
                  });
                },
                controller: _controller,
                children: [
                  OnBoardWidget(
                    Color: kSecondaryColor,
                    title: 'Collaborate Seamlessly with Your Team',
                    subTitle:
                        "Introduce users to the app's core purpose, highlighting its focus on teamwork and collaboration.",
                    images: Lottie.asset('assets/animation/collaborate.json'),
                  ),
                  OnBoardWidget(
                    title: 'Track Tasks and Meet Deadlines Efficiently',
                    subTitle:
                        "Emphasize how TeamTasker helps users stay organized and ensure that every team member knows what to work on and when.",
                    images: Lottie.asset('assets/animation/track.json'),
                    Color: kSecondaryColor,
                  ),
                  OnBoardWidget(
                    title: 'Boost Productivity and Achieve Goals Together',
                    subTitle:
                        "Showcase the ultimate benefit: improved productivity and reaching team milestones effectively.",
                    images: Lottie.asset('assets/animation/boost.json'),
                    Color: kSecondaryColor,
                  )
                ], 
              ),
              Container(
                alignment: const Alignment(0, 0.75),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (currentUser != null) {
                            Navigator.pushNamed(context, Mainscreen.id,
                                arguments: currentUser);
                          } else {
                            Navigator.pushNamed(context, Login.id);
                          }
                        },
                        child: const Text('Skip', style: kMediumHeader),
                      ),
                      SmoothPageIndicator(
                        controller: _controller,
                        count: 3,
                        effect: const SlideEffect(
                          dotHeight: 8,
                          dotWidth: 10,
                          dotColor: kLigterText,
                          activeDotColor: kLightBlue,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          _controller.nextPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeIn);
                        },
                        child: onLastPage
                            ? GestureDetector(
                                child: const Text(
                                  'Done',
                                  style: kMediumHeader,
                                ),
                              )
                            : const Text(
                                'Next',
                                style: kMediumHeader,
                              ),
                      ),
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
