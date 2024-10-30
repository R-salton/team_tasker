import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:team_tasker/controller/auth_controller.dart';
import 'package:team_tasker/views/components/CustomAppBar.dart';
import 'package:team_tasker/views/components/Task_tile.dart';
import 'package:team_tasker/views/components/grobal_methods.dart';
import 'package:team_tasker/views/components/widgets.dart';
import 'package:team_tasker/views/constants/constants.dart';

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
  late final size;
  final AuthController _authController = AuthController();
  final GlobalMethods _globalMethods = GlobalMethods();
  late PageController _pageController;

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
    _pageController = PageController(); //
  }

  Future<void> _getCurrentUser() async {
    try {
      setState(() async {
        currentUser = await widget._authController.getCurrentUser();
      });
    } catch (e) {}
  }

  final int _selectedIndex = 0;

  // Get the PageController
  PageController get pageController => _pageController;

  //Selector for filter
  bool _isSelected = true;

  @override
  void dispose() {
    _pageController.dispose(); // Dispose of the controller when done
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // This will provide total height and width of our screen
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: CustomAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // ignore: sized_box_for_whitespace
              HeaderWithSearch(size: size),
              SizedBox(
                height: 20.h,
              ),

              Container(
                padding: EdgeInsets.symmetric(horizontal: 25.w),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      FilterChip(
                        label: Text('All tasks'),
                        selected: _isSelected,
                        onSelected: (value) {
                          setState(() {
                            _isSelected = !_isSelected;
                          });
                        },
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      FilterChip(
                        label: Text('All tasks'),
                        selected: _isSelected,
                        onSelected: (value) {
                          setState(() {
                            _isSelected = !_isSelected;
                          });
                        },
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      FilterChip(
                        label: Text('All tasks'),
                        selected: _isSelected,
                        onSelected: (value) {
                          setState(() {
                            _isSelected = !_isSelected;
                          });
                        },
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      FilterChip(
                        label: Text('All tasks'),
                        selected: _isSelected,
                        onSelected: (value) {
                          setState(() {
                            _isSelected = !_isSelected;
                          });
                        },
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      FilterChip(
                        label: Text('All tasks'),
                        selected: _isSelected,
                        onSelected: (value) {
                          setState(() {
                            _isSelected = !_isSelected;
                          });
                        },
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      FilterChip(
                        label: Text('All tasks'),
                        selected: _isSelected,
                        onSelected: (value) {
                          setState(() {
                            _isSelected = !_isSelected;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 25.w),
                child: TitleWithMoreBtn(
                  title: 'Pending Tasks',
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              TaskTile(),
              TaskTile(),

              SizedBox(
                height: 10.h,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 25.w),
                child: TitleWithMoreBtn(
                  title: 'Completed Tasks',
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              TaskTile(),
              TaskTile(),
              SizedBox(
                height: 10.h,
              ),

              Container(
                padding: EdgeInsets.symmetric(horizontal: 25.w),
                child: TitleWithMoreBtn(
                  title: 'On going tasks',
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              TaskTile(),
              TaskTile(),
            ],
          ),
        ),
      ),
    );
  }
}
