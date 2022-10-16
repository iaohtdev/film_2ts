import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_info/constants.dart';
import 'package:movie_info/widget/ouline_paint.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({Key? key, required this.title, required this.ontap})
      : super(key: key);

  final String title;
  final Function() ontap;

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: ontap,
      child: SizedBox(
        width: Get.width,
        height: 50,
        child: CustomOutlineButton(
          strokeWidth: 3,
          radius: 30,
          gradient:  LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [kPink, kLightGreen],
          ),
          child: Container(
            width: Get.width - 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [kPink.withOpacity(0.5), kLightGreen.withOpacity(0.5)],
              ),
            ),
            child:  Center(
              child: Text(
                title,
                style:const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
