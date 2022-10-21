import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class IconBackWidget extends StatelessWidget {
  const IconBackWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      
                      child: SvgPicture.asset(
                        'assets/icons/icon-back.svg',
                       color: Colors.white,
                       height: 30,
                      ),
                    ),
                  );
  }
}