import 'package:dawn_app/globals/globals_stuff.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ScreenSearchPage extends StatefulWidget {
  const ScreenSearchPage({super.key});

  @override
  State<ScreenSearchPage> createState() => _ScreenSearchPageState();
}

class _ScreenSearchPageState extends State<ScreenSearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar,
      body: const Align(
        alignment: Alignment.topCenter,
        child: ListTile(
          title: TextField(
            decoration: InputDecoration(icon: Icon(Icons.search)),
          ),
        )
        
      ),
    );
  }
}