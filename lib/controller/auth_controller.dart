import 'package:firebase_auth/firebase_auth.dart';
import 'package:team_tasker/model/Auth.dart';

Auth authService = Auth();

class AuthController {
  
  void signIn() async {
    User? user = await authService.signInWithGoogle();
    if (user != null) {
      print("Signed in as ${user.displayName}");
    } else {
      print("Google Sign-In canceled or failed");
    }
  }
}
