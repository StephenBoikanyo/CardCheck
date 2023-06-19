import 'package:flutter/material.dart';


//Text Styles
const largeText = TextStyle(fontFamily: 'Roboto',fontSize: 22, fontWeight: FontWeight.w500);
const mediumText = TextStyle(fontFamily: 'Poppins',fontSize: 16, fontWeight: FontWeight.w400);
const smallText = TextStyle(fontFamily: 'Poppins',fontSize: 14, fontWeight: FontWeight.w400);

//Functions
String greeting() {
  var hour = DateTime.now().hour;
  if (hour < 12) {
    return 'Good Morning';
  }
  if (hour < 17) {
    return 'Good Afternoon';
  }
  return 'Good Evening';
}
