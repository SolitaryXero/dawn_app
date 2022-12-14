import 'dart:convert';

import 'package:dawn_app/globals/globals_stuff.dart';
import 'package:dawn_app/models/model_story.dart';
import 'package:dawn_app/screens/screen_description_page/screen_description_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_downloader/image_downloader.dart';



class ScreenDownloadPage extends StatefulWidget {
  const ScreenDownloadPage({super.key});

  
  @override
  State<ScreenDownloadPage> createState() => _ScreenDownloadPageState();
}


class _ScreenDownloadPageState extends State<ScreenDownloadPage> {
  
  final stories = getModel(savedArticle);
  
  String pathFinder (List<ModelStory> stories, int index){
    var path = ImageDownloader.findPath(stories[index].imageId).toString();
    return path;
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar("Downloads"),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 10,),
          SizedBox(
            height: MediaQuery.of(context).size.height-118,
            width: MediaQuery.of(context).size.width,
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.only(left: 10, right: 10),
              itemCount: stories.length,
              separatorBuilder: (context, index) => const SizedBox(height: 10,),
              itemBuilder: (context, index) => GestureDetector(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: ((context) => const ScreenDescriptionPage()))),
                child: Stack(children: [
                  Container(
                    height: kCardHeight,
                    width: MediaQuery.of(context).size.width - 10,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
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
                        stories[index].title,
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
            ),
          ),
        ],
      )
    );
  }
}