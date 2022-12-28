
import 'dart:ui';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:dawn_app/main.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../screen_home_page/screen_home_page.dart';


class ScreenSplash extends StatefulWidget {
  const ScreenSplash({super.key});

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}


class _ScreenSplashState extends State<ScreenSplash> {
  final colorizeTextStyle =
      const TextStyle(fontFamily: 'Canterbury', fontSize: 50);
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: TextLiquidFill(
          loadDuration: const Duration(milliseconds: 2999),
          text: 'Dawn',
          waveColor: Colors.white,
          boxBackgroundColor: Colors.black,
          textStyle: const TextStyle(
            fontSize: 80.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'CloisterBlack'
          ),
          waveDuration: const Duration(milliseconds: 1000),
          boxHeight: 100.0,
        ),
      animationDuration: const Duration(milliseconds: 2000),
      backgroundColor: Colors.black,
      nextScreen: const ScreenHomePage(),
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.rightToLeftWithFade,
      centered: true,
    );
  }
}
