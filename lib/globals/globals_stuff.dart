import 'package:flutter/material.dart';



double kCardHeight = 170;

TextStyle defaultTextTheme = const TextStyle(fontWeight: FontWeight.bold, color: Colors.white);

AppBar defaultAppBar(String title){
  return AppBar(
    title: Text(title),
    backgroundColor: const Color(0xff040826),  
  );
}
