import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:team_tasker/model/Auth.dart';

Auth authService = Auth();

class AuthController {
  final _auth = authService;

  Future<UserCredential?> googleSign() async {
    try {
      print("Called");
      await _auth.signInWithGoogle();
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  //Get User

  Future<User?> getCurrentUser() {
    return _auth.getCurrentUser();
  }

  // Register USer with email, lastname, first name , password

  Future<User?> registerUser({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    return await _auth.registerWithEmailAndPassword(
      context: context,
      firstName: firstName,
      lastName: lastName,
      email: email,
      password: password,
    );
  }

  // Sign in user
  Future<User?> signInUser({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
        context: context,
      );

      
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message); // Throw the error to be handled in UI
    } catch (e) {
      throw Exception("Unkown error");
    }
    return null;
  }

// Log out USer
  Future<void> signOut() async {
    _auth.SignOut();
  }
}
