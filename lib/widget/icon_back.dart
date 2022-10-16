import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class IconBackWidget extends StatelessWidget {
  const IconBackWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      height: 35,
                      width: 35,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(width: 2, color: Colors.white),
                      ),
                      child: SvgPicture.asset(
                        'assets/icons/icon-back.svg',
                      ),
                    ),
                  );
  }
}