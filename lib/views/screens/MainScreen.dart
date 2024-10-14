import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:team_tasker/controller/auth_controller.dart';
import 'package:team_tasker/views/constants/constants.dart';
import 'package:team_tasker/views/screens/Home.dart';

import 'package:team_tasker/views/screens/profilePage.dart';

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

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
        destinations: [
          NavigationDestination(icon: Icon(Iconsax.home), label: "Home"),
          NavigationDestination(icon: Icon(Iconsax.profile), label: "Profile")
        ],
      ),
      body: SafeArea(
        child: IndexedStack(
          index: _selectedIndex,
          children: [
            Home(
              user: currentUser,
            ),
            ProfilePage(),
            // GestureDetector(
            //   onTap: () async {
            //     await _authController.signOut();
            //     Navigator.pushNamed(context, Login.id);
            //   },
            //   child: Text('Logout'),
            // )
          ],
        ),
      ),
    );
  }
}
