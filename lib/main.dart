import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dawn_app/screens/screen_home_page/screen_home_page.dart';
import 'package:dawn_app/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:page_transition/page_transition.dart';

import 'screens/screen_Splash/screen_Splash.dart';

void main() async {
  await GetStorage.init();
  setupServiceLocators();

  CachedNetworkImage.logLevel = CacheManagerLogLevel.debug;

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({
    super.key,
  });

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      title: 'Flutter Demo',
      home: ScreenSplash(),
    );
  }
}
