import 'package:flutter/material.dart';

// Colos that use in our app

const kPink = Color(0xFFFE53BB);
const kBlack = Color(0xFF19191B);
const kYellow = Color(0xFFF2A33A);
const kLightGreen = Color(0xFF09FBD3);
const Color kGrey = Color(0xFF767680);
const Color kCyan = Color(0xFF08F7FE);

Color getColorBorder(String email, String password) {
  Color color = Colors.transparent;

  if (email.isEmpty || password.isEmpty) {
    color = Colors.red;
  } else {
    color = Colors.transparent;
  }
  return color;
}

 
unfocusKeyboard(BuildContext context ){
       FocusScope.of(context).unfocus();
  }
String minutesToHours(int minutes) {
    var d = Duration(minutes:minutes);
    List<String> parts = d.toString().split(':');
    return '${parts[0].padLeft(2, '0')}h ${parts[1].padLeft(2, '0')}m';
}
