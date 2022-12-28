import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  RxBool isDarkMode = false.obs;

  changeTheme() {
    Get.changeTheme(Get.isDarkMode ? ThemeData.light() : ThemeData.from(colorScheme: const ColorScheme.dark()));
    isDarkMode.toggle();
  }
}