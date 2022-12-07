import 'package:dawn_app/globals/globals_stuff.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ScreenSavedPage extends StatefulWidget {
  const ScreenSavedPage({super.key});

  @override
  State<ScreenSavedPage> createState() => _ScreenSavedPageState();
}

class _ScreenSavedPageState extends State<ScreenSavedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar("Saved Pages"),
    );
  }
}