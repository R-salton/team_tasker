import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:team_tasker/views/constants/constants.dart';
import 'package:team_tasker/views/screens/MainScreens/add_taskScreen.dart';
import 'package:team_tasker/views/screens/forgot_passwordPage.dart';
import 'package:team_tasker/views/screens/MainScreen.dart';
import 'package:team_tasker/views/screens/login.dart';
import 'package:team_tasker/views/screens/MainScreens/myTeamsScreen.dart';
import 'package:team_tasker/views/screens/onboarding_page.dart';
import 'package:team_tasker/views/screens/register_screen.dart';
import 'package:team_tasker/views/screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:team_tasker/views/screens/taskScreen.dart';
// Import Firebase core

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      child: MaterialApp(
        theme: ThemeData(
          fontFamily: 'ProximaNova',
          primaryColor: kPrimaryColor,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: Splash.id,
        routes: {
          OnBoardScreen.id: (context) => OnBoardScreen(),
          Login.id: (context) => const Login(),
          RegisterScreen.id: (context) => const RegisterScreen(),
          ForgotPassworsPage.id: (context) => const ForgotPassworsPage(),
          Mainscreen.id: (context) => Mainscreen(user: null),
          TasksScreen.id: (context) => TasksScreen(),
          AddTaskScreen.id: (context) => AddTaskScreen(),
          MyTeamsScreen.id: (context) => MyTeamsScreen(),
        },
        title: 'Team Tasker',
        home: const Scaffold(
            backgroundColor: kPrimaryColor,
            resizeToAvoidBottomInset: false,
            body: Splash()),
      ),
    );
  }
}
