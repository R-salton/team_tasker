import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lottie/lottie.dart';
import 'package:team_tasker/views/constants/constants.dart';
import 'package:team_tasker/views/screens/PendingTask.dart';

class OnBoardWidget extends StatelessWidget {
  final Color;
  final String title;
  final String subTitle;
  final LottieBuilder images;
  const OnBoardWidget(
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
  final bool obsecure;
  final inputType;
  ValueChanged<String>? onChange;

  MyTextField(
      {super.key,
      this.inputType,
      required this.obsecure,
      required this.controller,
      required this.hint,
      required this.onChange});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChange,
      keyboardType: inputType,
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
  final String title;
  final Function()? onTap;
  const Mybtn({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: kSecondaryColor,
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              title,
              style: const TextStyle(
                  color: kPrimaryColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w700),
            ),
          ),
        ),
      ),
    );
  }
}

// Custom Simple AppBAr

//  Function<Widget> simpleAppBar(String title) {

// return (context) => AppBar(
//         backgroundColor: kSecondaryColor,
//         title: Text(
//           title,
//           style: TextStyle(
//               color: kWhiteColor, fontSize: 20, fontWeight: FontWeight.w700),
//         ),
//         centerTitle: true,
//         iconTheme: IconThemeData(color: kWhiteColor),
//       );
// }

class SimpleAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;

  const SimpleAppBar({required this.title, super.key});

  @override
  State<SimpleAppBar> createState() => _SimpleAppBarState();

  // Implement the preferredSize getter here
  @override
  Size get preferredSize =>
      const Size.fromHeight(kToolbarHeight); // Standard AppBar height
}

class _SimpleAppBarState extends State<SimpleAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: kSecondaryColor,
      title: Text(
        widget.title,
        style: TextStyle(
          color: kWhiteColor,
          fontSize: 20,
          fontWeight: FontWeight.w700,
        ),
      ),
      centerTitle: true,
      iconTheme: IconThemeData(color: kWhiteColor),
    );
  }
}

//Home Header

class HeaderWithSearch extends StatelessWidget {
  const HeaderWithSearch({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(bottom: 1.h),
        // It'll  take 20% of the screen height
        height: size.height * 0.2,

        child: Stack(
          children: [
            Container(
              height: size.height * 0.2 - 27,
              decoration: BoxDecoration(
                color: kSecondaryColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(36),
                  bottomRight: Radius.circular(36),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.w),
                    child: Text(
                      'Hi ! Salton',
                      style: kHeadingStyle,
                    ),
                  ),

                  // We may add other  widgets here
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(
                  horizontal: 25.w,
                  vertical: 0,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 25.w,
                  vertical: 5.h,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: kWhiteColor,
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 10),
                        blurRadius: 50,
                        color: kSecondaryColor.withOpacity(0.23)),
                  ],
                ),
                height: 54.h,
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        onChanged: (value) {
                          //add Search functionality
                          // print(value);
                        },
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: kSecondaryColor),
                        decoration: InputDecoration(
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          hintText: 'Search',
                          hintStyle: TextStyle(
                            color: kSecondaryColor.withOpacity(0.5),
                          ),
                        ),
                      ),
                    ),

                    // Serach Icon

                    Icon(
                      Iconsax.search_normal,
                      color: kSecondaryColor.withOpacity(0.5),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TitleWithMoreBtn extends StatelessWidget {
  String title;
  TitleWithMoreBtn({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        Spacer(),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: kSecondaryColor,
          ),
          child: GestureDetector(
            onTap: () => Navigator.pushNamed(context, PendingTaskScreen.id),
            child: Text(
              'More',
              style: TextStyle(color: kWhiteColor),
            ),
          ),
        ),
      ],
    );
  }
}


