import 'package:dawn_app/globals/globals_stuff.dart';
import 'package:dawn_app/screens/screen_home_page/screen_home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

import '../../controllers/theme_controller.dart';
import '../../extensions.dart';

class ScreenSettingsPage extends StatefulWidget {
  const ScreenSettingsPage({
    super.key,
  });

  @override
  State<ScreenSettingsPage> createState() => _ScreenSettingsPageState();
}

class _ScreenSettingsPageState extends State<ScreenSettingsPage> {
  final ValueNotifier<bool> _isDarkModeNotifier = ValueNotifier(true);

  @override
  void initState() {
    super.initState();
    // final returnedValue = StringHelper.toMyCustomValue(true);
    final returnedValue = false.toCustomValue();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ThemeController>();

    return Scaffold(
      appBar: defaultAppBar("Settings"),
      body: ListView(
        children: [
          ListTile(
            title: const Text("Dark Mode"),
            trailing: SizedBox(
                width: 100,
                height: 50,
                child: Obx(() => Switch(
                    value: controller.isDarkMode.value,
                    onChanged: ((bool newValue) {
                      controller.changeTheme();
                    })))),
          ),
          ListTile(
            title: const Text("Share App"),
            trailing: IconButton(
                icon: const Icon(
                  Icons.share,
                  color: Colors.black,
                ),
                onPressed: () {}),
          ),
          ListTile(
            title: const Text("Contact Us"),
            trailing: GestureDetector(
              onTap: () {
                Clipboard.setData(const ClipboardData(text: 'editor@dawn.com'));
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: const Text('Article saved.', 
                    textAlign: TextAlign.center),
                    duration: const Duration(seconds: 1),
                    backgroundColor: Colors.lightBlue.shade500,
                    padding: const EdgeInsets.all(10),
                  ));
              },
              child: const Text(
                "editor@dawn.com",
                style: TextStyle(color: Colors.blue),
              )
            ),
          ),
          ListTile(
            title: const Text("Website"),
            trailing: GestureDetector(
              onTap: () {
                Share.share('https://Dawn.com');
              },
              child: const Text("https://Dawn.com", style: TextStyle(color: Colors.blue),),
            )
          )
        ],
      ),
    );
  }
}
