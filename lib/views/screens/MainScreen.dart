import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:iconsax/iconsax.dart';
import 'package:team_tasker/controller/auth_controller.dart';
import 'package:team_tasker/views/constants/constants.dart';
import 'package:team_tasker/views/screens/MainScreens/Home.dart';
import 'package:team_tasker/views/screens/MainScreens/add_taskScreen.dart';
import 'package:team_tasker/views/screens/MainScreens/myTeamsScreen.dart';

import 'package:team_tasker/views/screens/MainScreens/profilePage.dart';
import 'package:team_tasker/views/screens/taskScreen.dart';

class Mainscreen extends StatefulWidget {
  User? user;
  Mainscreen({super.key, required this.user});
  static String id = 'mainScreen';

  final AuthController _authController = AuthController();

  @override
  State<Mainscreen> createState() => _MainscreenState();
}

class _MainscreenState extends State<Mainscreen> {
  User? currentUser;
  final AuthController _authController = AuthController();
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // Retrieve the passed user from arguments
    currentUser = ModalRoute.of(context)!.settings.arguments as User?;
  }

  Future<void> _getCurrentUser() async {
    try {
      setState(() async {
        currentUser = await widget._authController.getCurrentUser();
      });
    } catch (e) {}
  }

  int _selectedIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      bottomNavigationBar: Container(
        child: SafeArea(
          child: Container(
            color: kSecondaryColor,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
              child: GNav(
                tabBackgroundColor: const Color.fromARGB(66, 130, 131, 133),
                backgroundColor: kSecondaryColor,
                color: kLigterText,
                textStyle:
                    TextStyle(fontWeight: FontWeight.w700, color: kWhiteColor),
                selectedIndex: _selectedIndex,
                activeColor: kWhiteColor,
                onTabChange: (value) {
                  setState(() {
                    _selectedIndex = value;
                  });
                },
                gap: 5,
                padding: EdgeInsets.all(16),
                iconSize: 22,
                tabs: [
                  GButton(
                    icon: Iconsax.task,
                    text: 'Tasks',
                  ),
                  GButton(
                    icon: Iconsax.add,
                    text: 'Add Team',
                  ),
                  GButton(
                    icon: Iconsax.home,
                    text: 'Home',
                  ),
                  GButton(
                    icon: Iconsax.people,
                    text: 'My teams',
                  ),
                  GButton(
                    icon: Icons.person,
                    text: 'Profile',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: IndexedStack(
          index: _selectedIndex,
          children: [
            TasksScreen(),
            AddTaskScreen(),
            Home(
              user: currentUser,
            ),
            MyTeamsScreen(),
            ProfilePage(),
          ],
        ),
      ),
    );
  }
}
