import 'package:flutter/material.dart';
import 'package:team_tasker/constants/constants.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SafeArea(
        child: Container(
            child: const Center(
          child: Text(
            'home',
            style: kSimpleTextStyle,
          ),
        )),
      ),
    );
  }
}
