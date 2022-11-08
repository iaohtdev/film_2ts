import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:webview_flutter/webview_flutter.dart';
class WebviewNofi extends StatefulWidget {

  const WebviewNofi({ Key? key,}) : super(key: key);

  @override
  State<WebviewNofi> createState() => _WebviewNofiState();
}

class _WebviewNofiState extends State<WebviewNofi> {

  @override
  void initState() {
    super.initState();
     if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
     
      body: WebView(
      
        initialUrl: "https://docs.google.com/document/d/1D7yl06pNX0ejGbZqGdoPFhrmOooLOFyd5IsI60MFvUQ/edit",
      ),

      floatingActionButton: GestureDetector(

        onTap: (){

          Get.back();
        },
        child: Container(
          height: 50,
           width: 50,
      
           decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.8),
            shape: BoxShape.circle
      
           ),
           
          child: Icon(Icons.close,
        ),
      ) )       
    );
  }
}