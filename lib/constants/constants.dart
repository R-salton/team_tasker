import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFFe2f2f3);
const kSecondaryColor = Color(0xFF0b1a31);
const kLightBlue = Color(0xFF3e9bbd);
const kLigterText = Color(0xFF626673);

const kSimpleTextStyle = TextStyle(
    fontSize: 16, fontWeight: FontWeight.w500, fontFamily: 'ProximaNova');

const kHeadingStyle = TextStyle(
  color: kPrimaryColor,
  fontSize: 20,
  fontFamily: 'ProximaNova',
  fontWeight: FontWeight.w600,
);
const kMediumHeader = TextStyle(
  color: kPrimaryColor,
  fontSize: 18,
  fontFamily: 'ProximaNova',
  fontWeight: FontWeight.w600,
);
final kButtonStyle = ButtonStyle(
  backgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
    if (states.contains(WidgetState.pressed)) {
      return Colors.white; // Background color when pressed
    }
    return Colors.transparent; // Default background color
  }),
  shape: WidgetStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5.0),
    ),
  ),
  side: WidgetStateProperty.all<BorderSide>(
    const BorderSide(color: kPrimaryColor), // Set border color if needed
  ),
  foregroundColor: WidgetStateProperty.resolveWith<Color>((states) {
    if (states.contains(WidgetState.pressed)) {
      return kSecondaryColor; // Text color when pressed
    }
    return kPrimaryColor; // Default text color
  }),
);
