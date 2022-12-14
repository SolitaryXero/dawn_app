import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/model_story.dart';



double kCardHeight = 170;

TextStyle defaultTextTheme = const TextStyle(fontWeight: FontWeight.bold, color: Colors.white);

bool isSaved = false;

int downloadCount = 0;

class Controller extends GetxController{
  List<ModelStory> savedStories = [];
  
}

AppBar defaultAppBar(String title){
  return AppBar(
    title: Text(title),
    backgroundColor: const Color(0xff040826),  
  );
}
