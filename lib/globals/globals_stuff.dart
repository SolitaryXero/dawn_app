import 'package:flutter/material.dart';



double kCardHeight = 170;

TextStyle defaultTextTheme = const TextStyle(fontWeight: FontWeight.bold, color: Colors.white);
AppBar defaultAppBar = AppBar(
  title: const Text("Dawn"),
  backgroundColor: const Color(0xff040826),  
);

ThemeMode appTheme = ThemeMode.light;

bool light = true;
bool islight = true;

void themeMode(value){
  light = value;
  if (islight = true){
    appTheme = ThemeMode.dark;
    islight = false;
  } else {
    appTheme = ThemeMode.light;
    islight = true;
  }
}

