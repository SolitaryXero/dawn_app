import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:share_plus/share_plus.dart';

import 'package:dawn_app/globals/globals_stuff.dart';
import 'package:dawn_app/models/model_story.dart';

class ScreenDescriptionPage extends StatefulWidget {
  const ScreenDescriptionPage({
    super.key,
    this.index = 0,
    this.stories = const [],
  });
  final int index;
  final List<ModelStory> stories;

  @override
  State<ScreenDescriptionPage> createState() => _ScreenDescriptionPageState();
}

class _ScreenDescriptionPageState extends State<ScreenDescriptionPage> {
  ScrollController scrollController = ScrollController();
  bool showbtn = false;
  double fontSize = 15;
  List<ModelStory> savedStories = [];

  @override
  void initState() {
    super.initState();

    if (mounted) {
      scrollController.addListener(() {
        double showoffset = 10;

        if (scrollController.offset > showoffset) {
          showbtn = true;
          setState(() {});
        } else {
          showbtn = false;
          setState(() {});
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

    return Scaffold(
      floatingActionButton: Stack(children: [
        //Menu
        FabCircularMenu(
            animationDuration: const Duration(milliseconds: 200),
            fabSize: 40,
            fabMargin: const EdgeInsets.all(20),
            fabOpenIcon: const Icon(
              Icons.menu,
              color: Colors.white,
            ),
            fabCloseIcon: const Icon(
              Icons.close,
              color: Colors.white,
            ),
            ringWidth: 40,
            ringDiameter: 270,
            ringColor: Colors.blue,
            children: [
              //Font Size Incrementor Button
              IconButton(
                onPressed: () {
                  setState(() {
                    fontSize--;
                  });
                },
                icon: const Icon(
                  Icons.remove_circle_outline,
                  color: Colors.white,
                ),
              ),

              //Font Size Decrementor Button
              IconButton(
                onPressed: () {
                  setState(() {
                    fontSize++;
                  });
                },
                icon: const Icon(
                  Icons.add_circle_outline,
                  color: Colors.white,
                ),
              ),

              //Share button
              IconButton(
                onPressed: () {
                  Share.share(
                    widget.stories[widget.index].articleLink,
                  );
                },
                icon: const Icon(
                  Icons.share,
                  color: Colors.white,
                ),
              ),

              //Copy Button
              IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: ((context) => AlertDialog(
                          contentPadding: const EdgeInsets.only(
                              right: 10, left: 10, top: 20, bottom: 0),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text("Cancel")),
                            TextButton(
                                child: const Text("Copy All"),
                                onPressed: () {
                                  Clipboard.setData(ClipboardData(
                                    text: widget.stories[widget.index].content,
                                  )).then((_) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            content: Text(
                                                "Article Content copied to clipboard")));
                                  });

                                  Navigator.pop(context);
                                }),
                          ],
                          content: SizedBox(
                              height: MediaQuery.of(context).size.height * 0.9,
                              width: MediaQuery.of(context).size.width * 0.9,
                              child: SelectableText(
                                widget.stories[widget.index].content,
                                scrollPhysics: const BouncingScrollPhysics(),
                              )))));
                },
                icon: const Icon(
                  Icons.copy,
                  color: Colors.white,
                ),
              ),

              //Download Button
              IconButton(
                onPressed: () async {
                  savedStories = getModel();
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: const Text('Article saved.', 
                    textAlign: TextAlign.center),
                    duration: const Duration(seconds: 1),
                    backgroundColor: Colors.lightBlue.shade500,
                    padding: const EdgeInsets.all(10),
                  ));
                  savedStories.add(ModelStory(
                    title: widget.stories[widget.index].title,
                    imageURL: widget.stories[widget.index].imageURL,
                    date: widget.stories[widget.index].date,
                    content: widget.stories[widget.index].content,
                    articleLink: widget.stories[widget.index].articleLink,
                  ));

                  final toSave = savedStories.map((e) => e.toJson()).toList();
                  await GetStorage().write('SavedStories', jsonEncode(toSave));
                },
                icon: const Icon(
                  Icons.download,
                  color: Colors.white,
                ),
              ),
            ]),

        //back arrow button
        Positioned(
          bottom: 50,
          right: 0,
          child: FloatingActionButton(
            heroTag: "btn2",
            backgroundColor: Colors.blue.withOpacity(0.6),
            elevation: 0,
            mini: true,
            child: const Icon(Icons.keyboard_arrow_left),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),

        //Up arrow button
        Positioned(
          right: 50,
          bottom: 0,
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 300), //show/hide animation
            opacity: showbtn ? 1.0 : 0.0, //set obacity to 1 on visible, or hide
            child: FloatingActionButton(
              mini: true,
              onPressed: () {
                scrollController.animateTo(
                    //go to top of scroll
                    0, //scroll offset to go
                    duration:
                        const Duration(milliseconds: 250), //duration of scroll
                    curve: Curves.fastOutSlowIn //scroll type
                    );
              },
              backgroundColor: Colors.blue.withOpacity(0.6),
              child: const Icon(Icons.keyboard_arrow_up),
            ),
          ),
        )
      ]),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          children: [
            //Image
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
              child: Stack(children: [
                CachedNetworkImage(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.3,
                  imageUrl: widget.stories[widget.index].imageURL,
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
                Container(
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.transparent, Colors.black87],
                  )),
                ),
                const Positioned(
                    bottom: 5,
                    left: 5,
                    child: Text(
                      "Wed, 30 Nov 2022",
                      style: TextStyle(color: Colors.white),
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
            const SizedBox(
              height: 30,
            ),
            //title
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: Text(
                widget.stories[widget.index].title,
                style: const TextStyle(
                    
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
            const SizedBox(
              height: 30,
            ),

            //content
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: Text(
                widget.stories[widget.index].content,
                style: TextStyle(
                    wordSpacing: 2,
                    letterSpacing: 1.5,
                    height: 1.3,
                    fontSize: fontSize),
              ),
            )
          ],
        ),
      ),
    );
  }
}
