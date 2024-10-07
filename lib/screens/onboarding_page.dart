import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:team_tasker/constants/constants.dart';
import 'package:team_tasker/screens/home.dart';

class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({super.key});

  @override
  State<OnBoardScreen> createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  final PageController _controller = PageController();
  bool onLastPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      images:
                          Lottie.asset('assets/animation/collaborate.json')),
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
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const Home();
                          }));
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
                              ? const Text(
                                  'Done',
                                  style: kMediumHeader,
                                )
                              : const Text(
                                  'Next',
                                  style: kMediumHeader,
                                ))
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

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
