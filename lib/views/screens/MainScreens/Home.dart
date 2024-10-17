import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:team_tasker/controller/auth_controller.dart';
import 'package:team_tasker/views/components/CustomAppBar.dart';
import 'package:team_tasker/views/components/grobal_methods.dart';
import 'package:team_tasker/views/components/widgets.dart';
import 'package:team_tasker/views/constants/constants.dart';
import 'package:team_tasker/views/screens/PendingTask.dart';
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
  late final Size size;
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
    // This will provide total height and width of our screen
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: CustomAppBar(),
      body: SafeArea(
        child: Column(
          children: [
            // ignore: sized_box_for_whitespace
            HeaderWithSearch(size: size),
            SizedBox(
              height: 20.h,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              child: TitleWithMoreBtn(
                title: 'Pending Tasks',
              ),
            )
          ],
        ),
      ),
    );
  }
}


