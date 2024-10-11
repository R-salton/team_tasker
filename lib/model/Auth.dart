import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:team_tasker/views/screens/home.dart';
import 'package:team_tasker/views/screens/login.dart';

class Auth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  User? get currentUser => _firebaseAuth.currentUser;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<UserCredential?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser == null) {
        // The user canceled the sign-in
        return null;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // Step 3: Create a new credential with the Google access token and ID token
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // final UserCredential userCredential =

      // final User? user = userCredential.user;

      return await _firebaseAuth.signInWithCredential(credential);
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<User?> getCurrentUser() async {
    try {
      final User? user = FirebaseAuth.instance.currentUser;
      return user;
    } catch (e) {}
    return null;
  }

  // Register user with email, password, and additional details
  Future<User?> registerWithEmailAndPassword({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      // Create user with Firebase Auth
      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? user = userCredential.user;

      signInWithEmailAndPassword(
          email: email, password: password, context: context);
      if (user != null) {
        // Store additional user details in Firestore
        await _firestore.collection('users').doc(user.uid).set({
          'firstName': firstName,
          'lastName': lastName,
          'email': email,
        });

        signInWithEmailAndPassword(
            email: email, password: password, context: context);
        Navigator.pushNamed(context, Home.id, arguments: user);
      }

      return user;
    } on FirebaseAuthException catch (e) {
      // Throw the error to be handled in the UI
      throw Exception(e.message);
    } catch (e) {
      throw Exception("An unknown error occurred");
      
    }
  }

  // Sign in user
  Future<User?> signInWithEmailAndPassword({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      // ignore: use_build_context_synchronously
      Navigator.pushNamed(context, Home.id, arguments: userCredential.user);
    } catch (e) {
      print('Error signing in: $e');
      return Navigator.pushNamed(context, Login.id, arguments: e.toString());
    }
    return null;
  }

  //Sign out

  Future<void> SignOut() async {
    _firebaseAuth.signOut();
  }
}
