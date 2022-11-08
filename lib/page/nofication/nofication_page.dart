import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_info/page/nofication/webview_nofi.dart';
import 'package:movie_info/widget/background_gradient.dart';

class NoficationPage extends StatelessWidget {
  const NoficationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height,
      width: Get.width,
      child: Stack(
        children: [
          const BackGroundGradient(),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.only(left: 20, right: 20, top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Thông báo',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  GestureDetector(
                    onTap: (){
                      Get.to(()=>WebviewNofi());
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            "Thông báo về việc ra mắt verison 1.0 của\nứng dụng tra cứu thông tin phim",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            )),
                               SizedBox(height: 5,),
                        Text("14pm, 11-11-2022",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            )),
                            SizedBox(height: 10,),
                        Container(
                          height: 1,
                          width: Get.width,
                          color: Colors.grey.withOpacity(0.4),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
