import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:webview_flutter/webview_flutter.dart';
class TermsOfUse extends StatefulWidget {
  const TermsOfUse({ Key? key }) : super(key: key);

  @override
  State<TermsOfUse> createState() => _TermsOfUseState();
}

class _TermsOfUseState extends State<TermsOfUse> {

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
        
          initialUrl: "https://www.themoviedb.org/terms-of-use?language=vi-VN",
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