
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dawn_app/globals/globals_stuff.dart';
import 'package:dawn_app/screens/screen_description_page/screen_description_page.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';



class ScreenDownloadPage extends StatefulWidget {
  const ScreenDownloadPage({super.key});

  
  @override
  State<ScreenDownloadPage> createState() => _ScreenDownloadPageState();
}


class _ScreenDownloadPageState extends State<ScreenDownloadPage> {
  

  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (GetStorage().read('SavedStorage') != null){
      final stories = getModel(savedArticle);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar("Downloads"),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 10,),
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
  dynamic checkNullBeforeApiCall (String savedArticle){
    if (GetStorage().read('SavedStories') != null){
      final stories = getModel(savedArticle);
      return stories;
    }
  }
}