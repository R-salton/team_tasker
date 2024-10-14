import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:team_tasker/controller/auth_controller.dart';
import 'package:team_tasker/views/constants/constants.dart';
import 'package:team_tasker/views/screens/login.dart';

class Home extends StatefulWidget {
  User? user;
  Home({super.key, required this.user});
  static String id = 'Home';

  final AuthController _authController = AuthController();

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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

  final int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              child: Center(
                child: Text(
                  'Welcom home${currentUser?.email}',
                  style: kSimpleTextStyle,
                ),
              ),
            ),
            Text('Home Screen'),
            GestureDetector(
              onTap: () async {
                await _authController.signOut();
                Navigator.pushNamed(context, Login.id);
              },
              child: Text('Logout'),
            )
          ],
        ),
      ),
    );
  }
}
