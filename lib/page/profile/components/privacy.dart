import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:movie_info/constants.dart';

import 'package:webview_flutter/webview_flutter.dart';
class PrivacyPage extends StatefulWidget {
  const PrivacyPage({ Key? key }) : super(key: key);

  @override
  State<PrivacyPage> createState() => _PrivacyPageState();
}

class _PrivacyPageState extends State<PrivacyPage> {

  @override
  void initState() {
    super.initState();
     if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
     
      body: SafeArea(
        child: WebView(
        
          initialUrl: "https://www.themoviedb.org/privacy-policy?language=vi-VN",
        ),
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