import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_info/constants.dart';
import 'package:movie_info/page/landing/landing_controller.dart';
import 'package:movie_info/routers/app_pages.dart';
import 'package:movie_info/widget/ouline_paint.dart';

class LandingPage extends GetView<LandingController> {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kBlack,
      extendBody: true,
      body: SizedBox(
        width: Get.width,
        height: Get.height,
        child: Stack(
          children: [
            Positioned(
              top: Get.height * 0.1,
              left: -88,
              child: Container(
                height: 166,
                width: 166,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color:kPink,
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 200,
                    sigmaY: 200,
                  ),
                  child: Container(
                    height: 166,
                    width: 166,
                    color: Colors.transparent,
                  ),
                ),
              ),
            ),
            Positioned(
              top: Get.height * 0.3,
              right: -100,
              child: Container(
                height: 200,
                width: 200,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: kLightGreen,
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 200,
                    sigmaY: 200,
                  ),
                  child: Container(
                    height: 200,
                    width: 200,
                    color: Colors.transparent,
                  ),
                ),
              ),
            ),
            SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: Get.width * 0.2,
                  ),
                  SizedBox(
                    height: Get.width * 0.8,

                    child: CustomOutlineButton(
                      strokeWidth: 4,
                      radius: Get.width * 0.8,
                     
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            kPink,
                            kPink.withOpacity(0),
                            kLightGreen.withOpacity(0.1),
                            kLightGreen
                          ],
                          stops: const [
                            0.2,
                            0.4,
                            0.6,
                            1
                          ]),
                      child: Container(
                      width: Get.width * 0.8,
                      height: Get.width *0.78,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            alignment: Alignment.bottomLeft,
                            image: AssetImage('assets/images/welcom_1.png'),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.06,
                  ),
                  Text(
                    'Chào mừng đến\nMEFIN',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.85),
                      fontSize: Get.height <= 667 ? 18 : 34,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.03,
                  ),
                  Text(
                    'Đăng nhập ngay để không bỏ lỡ những\n bộ phim bạn yêu thích',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.75),
                      fontSize: Get.height <= 667 ? 12 : 16,
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.06,
                  ),
                  InkWell(
                    onTap: (){
                      Get.toNamed(Routes.loginpage);
                    },
                    child: SizedBox(
                       width: 160,
                        height: 38,
                      child: CustomOutlineButton(
                        strokeWidth: 3,
                        radius: 20,
                       
                        gradient:  LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [kPink, kLightGreen],
                        ),
                        child: Container(
                          width: 160,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                kPink.withOpacity(0.5),
                                kLightGreen.withOpacity(0.5)
                              ],
                            ),
                          ),
                          child: const Center(
                            child: Text(
                              'Đăng nhập ngay',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
   Text(
                    'Version 1.0',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.6),
                      fontSize: Get.height <= 667 ? 12 : 14,
                    ),
                  ),

                    ]
                  ),
                  SizedBox(
                    height: Get.height * 0.01,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
