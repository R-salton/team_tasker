import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:team_tasker/controller/auth_controller.dart';
import 'package:team_tasker/views/components/CustomAppBar.dart';
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
  late final Size size;
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

  @override
  void dispose() {
    _pageController.dispose(); // Dispose of the controller when done
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // This will provide total height and width of our screen
    Size size = MediaQuery.of(context).size;
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
                child: TitleWithMoreBtn(
                  title: 'Pending Tasks',
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Column(
                children: [
                  SizedBox(
                    height: 200.h,
                    // Constrain the height of the ListView
                    child: ListView.builder(
                      itemCount: 2, // Number of TaskTile widgets
                      itemBuilder: (context, index) {
                        return TaskTile();
                      },
                    ),
                  ),
                  // You can add more widgets in the Column below the ListView
                ],
              ),

              SizedBox(
                height: 15.h,
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

              Column(
                children: [
                  SizedBox(
                    height: 200.h,
                    // Constrain the height of the ListView
                    child: ListView.builder(
                      itemCount: 2, // Number of TaskTile widgets
                      itemBuilder: (context, index) {
                        return TaskTile();
                      },
                    ),
                  ),
                  // You can add more widgets in the Column below the ListView
                ],
              ),

              Column(
                children: [
                  SizedBox(
                    height: 200.h,
                    // Constrain the height of the ListView
                    child: ListView.builder(
                      itemCount: 2, // Number of TaskTile widgets
                      itemBuilder: (context, index) {
                        return TaskTile();
                      },
                    ),
                  ),
                  // You can add more widgets in the Column below the ListView
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TaskTile extends StatelessWidget {
  const TaskTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 5.h),
      child: Container(
        height: 80.h,
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(vertical: 5.h),
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 10),
              blurRadius: 30,
              color: kSecondaryColor.withOpacity(.25),
            ),
          ],
        ),
        child: ListTile(
          leading: Image.asset('assets/images/google.png'),
          title: Container(
            child: Text(
              "Project Presentation",
              style: kMiniHeadingStyle,
            ),
          ),
          trailing: GestureDetector(
            onTap: () {
              QuickAlert.show(
                confirmBtnColor: kSecondaryColor,
                title: "Project Presentation",
                context: context,
                type: QuickAlertType.info,
                text: 'Buy two, get one free',
              );
            },
            child: Icon(
              Iconsax.arrow_right_1,
              color: kSecondaryColor,
              size: 30,
            ),
          ),
          subtitle: Text('Pending...'),
        ),
      ),
    );
  }
}
