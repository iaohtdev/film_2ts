import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:movie_info/constants.dart';
import 'package:movie_info/widget/ouline_paint.dart';

class IconBackWidget extends StatelessWidget {
  const IconBackWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: CustomOutlineButton(
                        strokeWidth: 3,
                            radius: 30,
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [kPink, kLightGreen],
                            ),
                      child: Container(
                        height: 40,
                        width: 40,
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                         shape: BoxShape.circle
                       
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: SvgPicture.asset(
                            'assets/icons/icon-back.svg',
                           
                          ),
                        ),
                      ),
                    ),
                  );
  }
}