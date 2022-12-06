import 'package:cached_network_image/cached_network_image.dart';
import 'package:dawn_app/globals/globals_stuff.dart';
import 'package:dawn_app/models/model_story.dart';
import 'package:dawn_app/screens/screen_home_page/screen_home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ScreenDescriptionPage extends StatefulWidget {
  const ScreenDescriptionPage({super.key, required this.index, required this.stories});
  final int index;
  final List<ModelStory> stories;

  @override
  State<ScreenDescriptionPage> createState() => _ScreenDescriptionPageState();
}

class _ScreenDescriptionPageState extends State<ScreenDescriptionPage> {
  ScrollController scrollController = ScrollController();
  bool showbtn = false;

  @override
  void initState() {
    super.initState();
    if (mounted){
      scrollController.addListener(() {
      double showoffset = 10;
      
      if (scrollController.offset > showoffset){
        showbtn = true;
        setState(() {
          
        });
      } else {
        showbtn = false;
        setState(() {
          
        });
      }
    });
    }
    
  }
  
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

    return Scaffold(
      floatingActionButton: Stack(children: [
        Align(
          alignment: Alignment.bottomRight, 
          child: FloatingActionButton(
            heroTag: "btn1",
            mini: true,
            child: const Icon(Icons.menu),
            onPressed: (){},
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          heightFactor: 17,
          child: FloatingActionButton(
            heroTag: "btn2",
            backgroundColor: Colors.blue.withOpacity(0.6),
            elevation: 0,
            mini: true,
            child: const Icon(Icons.keyboard_arrow_left),
            onPressed: (){
              Navigator.pop(context);
            }, 
          )
        ),
        Align(
          alignment: Alignment.bottomRight,
          widthFactor: 7.5,
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 1000),  //show/hide animation
            opacity: showbtn?1.0:0.0, //set obacity to 1 on visible, or hide
            child: FloatingActionButton(
              mini: true,
              onPressed:  () {
                scrollController.animateTo( //go to top of scroll
                    0,  //scroll offset to go
                    duration: const Duration(milliseconds: 500), //duration of scroll
                    curve:Curves.fastOutSlowIn //scroll type
                );
              },
              backgroundColor: Colors.blue.withOpacity(0.6),
              child: const Icon(Icons.arrow_upward),
            ),
          ),
        )
      ]),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,

              child: Stack(children: [
                CachedNetworkImage(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.3,
                  imageUrl: widget.stories[widget.index].imageURL,
                  errorWidget: (context, url, error) => Image.asset('assets/dawn.jpg'),
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(image: DecorationImage(image: imageProvider, fit: BoxFit.cover),),    
                  ),     
                  fit: BoxFit.contain,
                ),

                Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter, 
                      end: Alignment.bottomCenter, 
                      colors: [Colors.transparent, Colors.black87],
                    )
                  ),
                ),

                const Positioned(
                  bottom: 5,
                  left: 5,
                  child: Text("Wed, 30 Nov 2022", style: TextStyle(color: Colors.white),)
                ),

                const Positioned(
                  bottom: 5, 
                  right: 5,
                  child: Text("More by Dawn.com", style: TextStyle(color: Colors.white),)
                ),
              ]),
            ),

            const SizedBox(height: 50,),
            SizedBox(
              width: MediaQuery.of(context).size.width*0.9,
              child: Text(widget.stories[widget.index].title, 
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20
                ),
              ),
            ),
            
            const SizedBox(height: 10,),
            SizedBox(
              width: MediaQuery.of(context).size.width*0.9,
              child: Text(widget.stories[widget.index].content, style: const TextStyle(
                wordSpacing: 2,
                letterSpacing: 1.5,
                height: 1.3
              ),),
            )
          ],
        ),
      ),
    );
      
  }
}