import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_info/widget/background_gradient.dart';

class NoficationPage extends StatelessWidget {
  const NoficationPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height,
      width: Get.width,
      child: Stack(
        children: [
        const   BackGroundGradient(),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:const [
              Text(
                'Profile',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                ),
              ),
            ],
          )
        ),
        ],
      ),
    );
  }
}