import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../models/model_story.dart';



double kCardHeight = 170;

TextStyle defaultTextTheme = const TextStyle(fontWeight: FontWeight.bold, color: Colors.white);

bool isSaved = false;

int downloadCount = 0;

// dynamic savedArticle = json.decode(GetStorage().read('SavedStories') ??  "[]" ) ?? [];

class Controller extends GetxController{
  List<ModelStory> savedStories = [];
  
}

List<ModelStory> getModel (){
  dynamic story = json.decode(GetStorage().read('SavedStories') ??  "[]" ) ?? [];

  List<ModelStory> stories = List<ModelStory>.from(story.map((e) => ModelStory.fromJson(e)).toList());  
  return stories;
}

AppBar defaultAppBar(String title){
  return AppBar(
    title: Text(title),
    backgroundColor: const Color(0xff040826),  
  );
}
