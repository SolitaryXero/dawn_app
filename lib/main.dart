import 'package:cached_network_image/cached_network_image.dart';
import 'package:dawn_app/screens/screen_home_page/screen_home_page.dart';
import 'package:dawn_app/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'controllers/theme_controller.dart';
import 'globals/globals_stuff.dart';

void main() {
  setupServiceLocators();
  CachedNetworkImage.logLevel = CacheManagerLogLevel.debug;
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key,});
  
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(  
      title: 'Flutter Demo',
      darkTheme: ThemeData.dark(),
      themeMode: appTheme,
      home: const ScreenHomePage(),
    );
  }
}
