
import 'package:dawn_app/globals/globals_stuff.dart';
import 'package:dawn_app/screens/screen_home_page/screen_home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../controllers/theme_controller.dart';
import '../../extensions.dart';

class ScreenSettingsPage extends StatefulWidget {
  const ScreenSettingsPage({super.key,});

  @override
  State<ScreenSettingsPage> createState() => _ScreenSettingsPageState();
}

class _ScreenSettingsPageState extends State<ScreenSettingsPage> {

  // bool light = true;

  final ValueNotifier<bool> _isDarkModeNotifier = ValueNotifier(true);

  @override
  void initState() {
    
    super.initState();

    // final returnedValue = StringHelper.toMyCustomValue(true);
    final returnedValue = false.toCustomValue();
    print(returnedValue);


  }


   
  @override
  Widget build(BuildContext context) {
    print("Build was called");
    final controller = Get.find<ThemeController>();

    return Scaffold(
      appBar: defaultAppBar,
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
                      // _isDarkModeNotifier.value = newValue;
                      // setState(() {
                      //   light = value;
                      // });
                      controller.changeTheme();
                      // Get.changeTheme(Get.isDarkMode? ThemeData.light(): ThemeData.dark());
                  
                  })))
              
            ),
          ),
          ListTile(
            title: const Text("Share App"),
            trailing: IconButton(
              icon: const Icon(Icons.share, color: Colors.black,),
              onPressed: (() => Get.changeTheme(Get.isDarkMode? ThemeData.light() : ThemeData.dark())),
            ),
          ),
          ListTile(
            title: const Text("Contact Us"),
            trailing: GestureDetector(
              onTap: (){Navigator.push(context, MaterialPageRoute(builder: ((context) => const ScreenHomePage())));},
              child: const Text("Editor@dawn.com", style: TextStyle(color: Colors.blue),)),
          ),
          ListTile(
            title: const Text("Website"),
            trailing: GestureDetector(
              onTap: (){Navigator.push(context, MaterialPageRoute(builder: ((context) => const ScreenHomePage())));},
              child: GestureDetector( onTap: () => Clipboard.getData("text/plain"), child: const Text("https://Dawn.com", style: TextStyle(color: Colors.blue),))),
          )
        ],
      ),
    );
  }
}