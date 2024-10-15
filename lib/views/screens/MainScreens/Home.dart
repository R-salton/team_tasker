import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:team_tasker/controller/auth_controller.dart';
import 'package:team_tasker/views/components/CustomAppBar.dart';
import 'package:team_tasker/views/components/grobal_methods.dart';
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
  final GlobalMethods _globalMethods = GlobalMethods();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // Retrieve the passed user from arguments
    currentUser = ModalRoute.of(context)!.settings.arguments as User?;
  }

  @override
  void initState() {
    super.initState();
    _authController.getCurrentUser();
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
      appBar: CustomAppBar(),
      body: SafeArea(
        child: Container(
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 25.h),
                  child: Container(
                    decoration: BoxDecoration(
                      color: kSecondaryColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    height: 150.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Welcom home${currentUser?.email}',
                              style: TextStyle(color: kWhiteColor),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8),
                          child: Text('Manage your Teams any where'),
                        )
                      ],
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
        ),
      ),
    );
  }
}
