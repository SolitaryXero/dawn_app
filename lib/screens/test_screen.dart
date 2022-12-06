import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  double sisze = 100;
  String cleanText = '''<p> <figure class='media w-full w-full media--stretch media--uneven media--stretch
  '> <div class='media__item media__item--twitter '><span> <blockquote class="twitter-tweet" lang="en"> <a href="https://twitter.com/CMShehbaz/status/1599370890591862784"></a> </blockquote> 
  </span></div> </figure></p> <p>PTI leader Imran Khan’s recent diatribe against parliamentary democracy was the latest in 
  a series of attacks that flew in the face of how de mocracy functioned in modern nation-states, he wrote.</p> ''';

  String clean_text(String cleanText){
    String result;
    result = cleanText.replaceAll(RegExp(r'<figure[^>]*>|</figure>|<div[^>]*>|</div>|<span[^>]*>|</span>|<blockquote[^>]*>|</blockquote>|<a[^>]*>|</a>'), '');
    return result.toString();
  }

  @override
  void initState() {
    super.initState();
    

    scheduleMicrotask ( () async {
      setState(() {
        sisze = 200;
      });

      await Future.delayed(const Duration(milliseconds: 1400));
      scheduleMicrotask ( ()  {
          setState(() {
            sisze = 100;
          });
        });

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SizedBox(height: 600, width: 600,child: Text(clean_text(cleanText)))
      ),
    );
  }
}