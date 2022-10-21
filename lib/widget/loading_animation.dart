import 'package:flutter/material.dart';

class LoadingWidget{

static showLoading(BuildContext context){
   
    showDialog(barrierDismissible: false,
      context:context,
      builder:(BuildContext context){
        return Image.asset("assets/gif/loading.gif",scale: 2,);
      },
    );
  }


}