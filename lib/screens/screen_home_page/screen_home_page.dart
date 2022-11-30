
import 'dart:ui';

import 'package:dawn_app/Services/api_manager.dart';
import 'package:dawn_app/globals/globals_stuff.dart';
import 'package:dawn_app/models/model_story.dart';
import 'package:dawn_app/screens/screen_Search_page/screen_Search_page.dart';
import 'package:dawn_app/screens/screen_saved_page/screen_saved_page.dart';
import 'package:dawn_app/screens/screen_settings_page/screen_settings_page.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class ScreenHomePage extends StatefulWidget {
  const ScreenHomePage({super.key, });
  
  @override
  State<ScreenHomePage> createState() => _ScreenHomePageState();
}

class _ScreenHomePageState extends State<ScreenHomePage> {

  List<ModelStory> stories = [];


      
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
                ListTile(title: Text("Home", style: defaultTextTheme,),onTap: (){} ,),
                ListTile(title: Text("Latest-news", style: defaultTextTheme,), onTap: (){},),
                ListTile(title: Text("Business", style: defaultTextTheme,),onTap: () {},),
                ListTile(title: Text("Opinion", style: defaultTextTheme,),onTap: () {},),
                ListTile(title: Text("Sports", style: defaultTextTheme,),onTap: () {},),
                ListTile(title: Text("World", style: defaultTextTheme,),onTap: () {},),
                ListTile(title: Text("Pakistan", style: defaultTextTheme,),onTap: () {},),
                ListTile(title: Text("Magazine", style: defaultTextTheme,),onTap: () {},),
                ListTile(title: Text("Blogs", style: defaultTextTheme,),onTap: () {},),
                ListTile(title: Text("Live-blog", style: defaultTextTheme,),onTap: () {},),
                ListTile(title: Text("Entertainment", style: defaultTextTheme,),onTap: () {},),
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
              stories = await GetIt.I<IApiManager>().getNews("home");
              
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

      body: SizedBox(
        height: 350,
        width: 300,
        child: ListView.separated(
          padding: const EdgeInsets.all(10),
          physics: const BouncingScrollPhysics(),
          itemCount: stories.length,
          itemBuilder: ((context, index) => Stack(children: [
            Container(
            height: kCardHeight,
            width: MediaQuery.of(context).size.width ,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(image: NetworkImage(stories[index].imageURL), fit: BoxFit.cover)
            )),
            Container(
              height: kCardHeight,
              width: MediaQuery.of(context).size.width ,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                gradient: LinearGradient(colors: [Colors.grey.withOpacity(0.0), Colors.black], begin: Alignment.topCenter, end: Alignment.bottomCenter),
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
            
          ])),
          separatorBuilder: (context, index) => const SizedBox(height: 10,),
        ),
      ),
    );
  }
}
