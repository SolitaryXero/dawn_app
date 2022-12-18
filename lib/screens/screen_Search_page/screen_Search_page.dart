import 'package:dawn_app/globals/globals_stuff.dart';
import 'package:dawn_app/models/model_story.dart';
import 'package:dawn_app/screens/screen_description_page/screen_description_page.dart';
import 'package:flutter/material.dart';

import 'package:webview_flutter/webview_flutter.dart';


class ScreenSearchPage extends StatefulWidget {
  const ScreenSearchPage({super.key});

  @override
  State<ScreenSearchPage> createState() => _ScreenSearchPageState();
}

class _ScreenSearchPageState extends State<ScreenSearchPage> {

  List<ModelStory> stories = getModel();
  String searchValue = '';

  api2 (){
    
  }

  var controller = WebViewController();

  void webview(searchValue){
    controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(const Color(0x00000000))
    ..setNavigationDelegate(
      NavigationDelegate(
        onProgress: (int progress) {
          // Update loading bar.
        },
        onPageStarted: (String url) {},
        onPageFinished: (String url) {},
        onWebResourceError: (WebResourceError error) {},
        onNavigationRequest: (NavigationRequest request) {
          if (request.url.startsWith('https://www.dawn.com/news/')) {
            print(request.url);
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
      ),
    );

    
  }
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      webview(searchValue);
    });
    
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar("Search"),
      body: Column(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: ListTile(
              leading: IconButton(onPressed: (() => controller.goBack() ), icon: const Icon(Icons.arrow_back,)),
              title: TextField(
                onSubmitted: (value) {
                  setState(() {
                    controller.loadRequest(Uri.parse('https://www.dawn.com/search?cx=016184311056644083324%3Aa1i8yd7zymy&cof=FORID%3A10&ie=UTF-8&q=$value'));
                  });
                },                
                autofocus: true,
                decoration: const InputDecoration(icon: Icon(Icons.search),)
              ),
            )
          ),
          Expanded(child: WebViewWidget(controller: controller,))

        ],
      ),
    );
  }
}