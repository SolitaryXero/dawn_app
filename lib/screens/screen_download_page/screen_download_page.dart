import 'package:dawn_app/globals/globals_stuff.dart';
import 'package:dawn_app/screens/screen_description_page/screen_description_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';



class ScreenDownloadPage extends StatefulWidget {
  const ScreenDownloadPage({super.key});

  
  @override
  State<ScreenDownloadPage> createState() => _ScreenDownloadPageState();
}


class _ScreenDownloadPageState extends State<ScreenDownloadPage> {
  final Controller c = Get.put(Controller());
  
  var story = GetStorage().read('story');
  var sor;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar("Downloads"),
      body: ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemCount: GetStorage().read('story').length,
        separatorBuilder: (context, index) => const SizedBox(height: 10,),
        itemBuilder: (context, index) => GestureDetector(
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: ((context) => ScreenDescriptionPage()))),
          child: Stack(children: [
            Container(
              height: kCardHeight,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.black87],
                ),
                image: DecorationImage(image: AssetImage('assets/dawn.jpg'))
              ),
            ),
            Positioned(
                bottom: 5,
                left: 5,
                child: Text(
                  // GetStorage().read('story')[1].title,
                  sor = story[1].title,
                  style: const TextStyle(color: Colors.white),
                )),
            const Positioned(
                bottom: 5,
                right: 5,
                child: Text(
                  "More by Dawn.com",
                  style: TextStyle(color: Colors.white),
                )),
          ]),
        ),
      )
    );
  }
}