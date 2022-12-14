

import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dawn_app/Services/api_manager.dart';
import 'package:dawn_app/globals/globals_stuff.dart';
import 'package:dawn_app/models/model_story.dart';
import 'package:dawn_app/screens/screen_Search_page/screen_Search_page.dart';
import 'package:dawn_app/screens/screen_description_page/screen_description_page.dart';
import 'package:dawn_app/screens/screen_download_page/screen_download_page.dart';
import 'package:dawn_app/screens/screen_saved_page/screen_saved_page.dart';
import 'package:dawn_app/screens/screen_settings_page/screen_settings_page.dart';
import 'package:dawn_app/screens/test_screen.dart';
import 'package:dawn_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class ScreenHomePage extends StatefulWidget {
  const ScreenHomePage({super.key, });
  
  @override
  State<ScreenHomePage> createState() => _ScreenHomePageState();
}

class _ScreenHomePageState extends State<ScreenHomePage> {

  List<ModelStory> stories = [];
  int categoryIndex = 0;
  

  @override
  void initState() {
    super.initState();
    initialScreen().then((value) {
       setState(() {
      
      });
    });
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) { 
    //   Navigator.of(context).push(MaterialPageRoute(builder: ((context) => const TestScreen())));
    // });
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      
    //   initialScreen();

    // });
    
  }


  
  Future<void> initialScreen () async {
    stories = await GetIt.I<IApiManager>().getNews("home");
  }

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      drawer: Padding(
        padding: const EdgeInsets.only(top: 80, bottom: 50),
        child: Drawer(
          width: MediaQuery.of(context).size.width * 0.6,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black, Color(0xff040826)]
              ),
              borderRadius: BorderRadius.only(topRight: Radius.circular(10), bottomRight: Radius.circular(10) ),
            ),
            child: ListView(
              padding: const EdgeInsets.only(top: 0),
              children: [
                //Heading
                Container(
                  height: 40,
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(topRight: Radius.circular(10))
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Dawn News", style: TextStyle(color: Colors.white, fontSize: 21, fontWeight: FontWeight.bold),),
                  ),
                ),

                //Categories

                //Home 
                ListTile(title: Text("Home", style: defaultTextTheme,),
                  onTap: ()async{
                    stories = await GetIt.I<IApiManager>().getNews("home");
                    if(mounted){setState(() {
                      Navigator.pop(context);
                      categoryIndex = 0;
                    });}
                  },
                ),

                //Latest News
                ListTile(title: Text("Latest", style: defaultTextTheme,), 
                  onTap: ()async{
                    stories = await GetIt.I<IApiManager>().getNews("latest-news");
                    if(mounted){setState(() {
                      Navigator.pop(context);
                      categoryIndex = 1;
                    });}
                  },
                ),

                //Pakistan
                ListTile(title: Text("Pakistan", style: defaultTextTheme,),
                  onTap: ()async{
                    stories = await GetIt.I<IApiManager>().getNews("Pakistan");
                    if(mounted){setState(() {
                      Navigator.pop(context);
                      categoryIndex = 2;
                    });}
                  },
                ),

                //Opinion
                ListTile(title: Text("Opinion", style: defaultTextTheme,),
                  onTap: ()async{
                    stories = await GetIt.I<IApiManager>().getNews("Opinion");
                    if(mounted){setState(() {
                      Navigator.pop(context);
                      categoryIndex = 3;
                    });}
                  },
                ),

                //Business
                ListTile(title: Text("Business", style: defaultTextTheme,),
                  onTap: ()async{
                    stories = await GetIt.I<IApiManager>().getNews("Business");
                    if(mounted){setState(() {
                      Navigator.pop(context);
                      categoryIndex = 4;
                    });}
                  },
                ),

                //World
                ListTile(title: Text("World", style: defaultTextTheme,),
                  onTap: ()async{
                    stories = await GetIt.I<IApiManager>().getNews("World");
                    if(mounted){setState(() {
                      Navigator.pop(context);
                      categoryIndex = 5;
                    });}
                  },
                ),

                //Sports
                ListTile(title: Text("Sports", style: defaultTextTheme,),
                  onTap: ()async{
                    stories = await GetIt.I<IApiManager>().getNews("Sport");
                    if(mounted){setState(() {
                      Navigator.pop(context);
                      categoryIndex = 6;
                    });}
                  },
                ),

                //Magazine
                ListTile(title: Text("Magazine", style: defaultTextTheme,),
                  onTap: ()async{
                    stories = await GetIt.I<IApiManager>().getNews("Magazine");
                    if(mounted){setState(() {
                      Navigator.pop(context);
                      categoryIndex = 7;
                    });}
                  },
                ),

                //Blogs
                ListTile(title: Text("Blogs", style: defaultTextTheme,),
                  onTap: ()async{
                    stories = await GetIt.I<IApiManager>().getNews("Blogs");
                    if(mounted){setState(() {
                      Navigator.pop(context);
                      categoryIndex = 8;
                    });}
                  },
                ),

                //Live-blog
                ListTile(title: Text("Live-blog", style: defaultTextTheme,),
                  onTap: ()async{
                    stories = await GetIt.I<IApiManager>().getNews("Live-blog");
                    if(mounted){setState(() {
                      Navigator.pop(context);
                      categoryIndex = 9;
                    });}
                  },
                ),
              ]
            ),
          ),
        ),
      ),

      appBar: AppBar(
        backgroundColor: const Color(0xff040826),
        title: const Text("Dawn"),
        actions: [
          
          //Saved Pages
          IconButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder:(context) => const ScreenSavedPage() ,));
            }, 
            icon: const Icon(Icons.book)),

          //Downloands
          IconButton(
            onPressed: () async {
              Navigator.of(context).push(MaterialPageRoute(builder: ((context) => const ScreenDownloadPage())));
            }, 
            icon: const Icon(Icons.download)),

          //Search
          IconButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder:(context) => const ScreenSearchPage() ,));
            }, 
            icon: const Icon(Icons.search)),

          //Settings
          IconButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder:(context) => const ScreenSettingsPage() ,));
            }, 
            icon: const Icon(Icons.settings)
          ),
        ],
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 10,),
          SizedBox(child: Text(categoriesDawn[categoryIndex]),),
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
                    builder: (context) => ScreenDescriptionPage(index: index, stories: stories,),
                    settings: RouteSettings(
                      arguments: stories[index].imageURL
                    )
                )),
                child: Stack(children: [
                  CachedNetworkImage(
                    width: MediaQuery.of(context).size.width ,
                    height: kCardHeight,
                    imageUrl: stories[index].imageURL,
                    errorWidget: (context, url, error) => Image.asset('assets/dawn.jpg'),
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
                      ),
                    ),     
                    fit: BoxFit.cover,
                  ),
                  
                  
                  Container(
                    height: kCardHeight,
                    width: MediaQuery.of(context).size.width ,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: const LinearGradient(
                        colors: [Colors.transparent, Colors.black], 
                        begin: Alignment.topCenter, 
                        end: Alignment.bottomCenter
                      ),
                    ),
                  ),
                  
                  Positioned(
                    top: kCardHeight - 80,
                    left: MediaQuery.of(context).size.width * 0.07,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width *0.9,
                      child: Text(
                        stories[index].title,
                        style: const TextStyle(color: Colors.white, fontSize: 17, fontFamily: "Raleway"),
                      ),
                    ),
                  ),
              
                  Positioned(
                    bottom: 10,
                    right: 10,
                    child: Text(
                      stories[index].date,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  
                ]),
              )),
              separatorBuilder: (context, index) => const SizedBox(height: 10,),
            ),
          ),
        ],
      ),
    );
  }


}
