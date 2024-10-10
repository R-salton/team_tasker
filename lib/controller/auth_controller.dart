import 'package:team_tasker/model/Auth.dart';

Auth authService = Auth();

class AuthController {
  final _auth = authService;
  void signIn() async {
    try {
      print("Called");
      await _auth.signInWithGoogle();
    } catch (e) {
      print(e.toString());
    }
  }
}
