import 'package:dawn_app/globals/globals_stuff.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ScreenDownloadPage extends StatefulWidget {
  const ScreenDownloadPage({super.key});

  @override
  State<ScreenDownloadPage> createState() => _ScreenDownloadPageState();
}

class _ScreenDownloadPageState extends State<ScreenDownloadPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar,
    );
  }
}