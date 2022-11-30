import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ThemeController extends GetxController {
  RxBool isDarkMode = false.obs;

  changeTheme() {
    Get.changeTheme(Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
    isDarkMode.toggle();
  }
}