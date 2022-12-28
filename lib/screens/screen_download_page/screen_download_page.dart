import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dawn_app/globals/globals_stuff.dart';
import 'package:dawn_app/models/model_story.dart';
import 'package:dawn_app/screens/screen_description_page/screen_description_page.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class ScreenDownloadPage extends StatefulWidget {
  const ScreenDownloadPage({super.key});

  @override
  State<ScreenDownloadPage> createState() => _ScreenDownloadPageState();
}

class _ScreenDownloadPageState extends State<ScreenDownloadPage> {
  List<ModelStory> stories = getModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text("Downloads"),
        actions: [
          IconButton(
              onPressed: () async {
                  stories.clear();
                  setState(() {});

                final toSave = stories.map((e) => e.toJson()).toList();
                await GetStorage().write('SavedStories', jsonEncode(toSave));
              },
              tooltip: 'Delete All',
              icon: const Icon(Icons.delete_outline))
        ],
        backgroundColor: defaultThemeColor,
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height - 134,
            child: ListView.separated(
              padding: const EdgeInsets.all(10),
              physics: const BouncingScrollPhysics(),
              itemCount: stories.length,
              itemBuilder: ((context, index) => GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ScreenDescriptionPage(
                                  index: index,
                                  stories: stories,
                                ),
                            settings: RouteSettings(
                                arguments: stories[index].imageURL))),
                    child: Stack(children: [
                      CachedNetworkImage(
                        width: MediaQuery.of(context).size.width,
                        height: kCardHeight,
                        imageUrl: stories[index].imageURL,
                        errorWidget: (context, url, error) =>
                            Image.asset('assets/dawn.jpg'),
                        imageBuilder: (context, imageProvider) => Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: imageProvider, fit: BoxFit.cover),
                          ),
                        ),
                        fit: BoxFit.cover,
                      ),

                      //Card Gradient
                      Container(
                        height: kCardHeight,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: const LinearGradient(
                              colors: [Colors.transparent, Colors.black],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter),
                        ),
                      ),

                      //Card Title
                      Positioned(
                        top: kCardHeight - 80,
                        left: MediaQuery.of(context).size.width * 0.07,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.9,
                          child: Text(
                            stories[index].title,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontFamily: "Raleway"),
                          ),
                        ),
                      ),

                      //Card Date
                      Positioned(
                        bottom: 10,
                        right: 10,
                        child: Text(
                          stories[index].date,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),

                      //Delete Button
                      Align(
                        alignment: Alignment.topRight,
                        child: IconButton(
                          onPressed: () async {
                            try {
                              stories.remove(stories[index]);
                              setState(() {});
                            } on RangeError {
                              print("Range Error has occured on line 109");
                            }

                            final toSave =
                                stories.map((e) => e.toJson()).toList();
                            await GetStorage()
                                .write('SavedStories', jsonEncode(toSave));
                          },
                          icon: const Icon(Icons.delete_outline),
                          color: Colors.white,
                        ),
                      ),
                    ]),
                  )),
              separatorBuilder: (context, index) => const SizedBox(
                height: 10,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
