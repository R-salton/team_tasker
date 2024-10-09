import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:team_tasker/views/constants/constants.dart';
import 'package:team_tasker/views/screens/login.dart';
import 'package:team_tasker/views/screens/onboarding_page.dart';
import 'package:team_tasker/views/screens/register_screen.dart';
import 'package:team_tasker/views/screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart'; // Import Firebase core
import 'firebase_options.dart';

void main() async {
  // Ensures that all binding for widgets is initialized before Firebase
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (e) {
    print('Firebase initialization error: $e');
  }
  runApp(
    const MainApp(),
  );
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
          OnBoardScreen.id: (context) => const OnBoardScreen(),
          Login.id: (context) => const Login(),
          RegisterScreen.id: (context) => const RegisterScreen()
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
