import 'package:dotted_border/dotted_border.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:movie_info/page/edit_profile/edit_profile.controller.dart';

import '../../constants.dart';
import '../../widget/background_gradient.dart';
import '../../widget/custom_textfield.dart';

class EditProfile extends GetView<EditProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlack,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            SizedBox(
                height: Get.height,
                width: Get.width,
                child: const BackGroundGradient()),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    children: [
                      _header(),
                      SizedBox(height: 24),
                      _body(),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _header() => Column(
        children: [
          SizedBox(height: 80),
          Align(
            alignment: Alignment.center,
            child: Container(
              height: 180,
              child: Stack(
                children: [
                  DottedBorder(
                    color: Colors.deepOrange,
                    borderType: BorderType.Circle,
                    radius: Radius.circular(60),
                    dashPattern: [20, 5],
                    strokeWidth: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(3),
                      child: Container(
                        height: 150,
                        width: 150,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage("assets/images/poster_2.jpg"),
                                fit: BoxFit.cover)),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 64,
                    bottom: 5,
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: const BoxDecoration(
                          color: Colors.black,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                            child: SvgPicture.asset(
                          "assets/icons/icon-camera.svg",
                          height: 15,
                          color: Colors.white,
                        )),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 24),
          Text('Mohamah Sela',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.w400,
              )),
          SizedBox(height: 8),
          Text('0xFF19191B',
              style: TextStyle(
                fontSize: 12,
                color: Colors.white,
                fontWeight: FontWeight.w200,
              ))
        ],
      );

  Widget _body() => Column(children: [
        CustomTextField(
          focusNode: controller.nameFocus,
          title: 'Full Name',
          controller: controller.nameController,
          prefixIcon: SvgPicture.asset('assets/icons/icon-profile_outline.svg',
              color: Colors.white, height: 24, width: 24),
        ),
        SizedBox(height: 15),
        CustomTextField(
          focusNode: controller.mailFocus,
          title: 'Email',
          controller: controller.mailController,
          prefixIcon: SvgPicture.asset('assets/icons/icon-mail.svg',
              color: Colors.white, height: 24, width: 24),
        ),
        SizedBox(height: 15),
        CustomTextField(
          focusNode: controller.phoneFocus,
          title: 'Mobile Number',
          controller: controller.phoneController,
          prefixIcon: SvgPicture.asset('assets/icons/icon-phonenum.svg',
              color: Colors.white, height: 24, width: 24),
        ),
        SizedBox(height: 50),
        InkWell(
          onTap: () {},
          child: Container(
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.black,
              ),

          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/icons/icon-upload.svg', color: Colors.white, height: 24, width: 24),
              SizedBox(width: 24),
              Text('Update',   style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.white))
            ],
          )
          ),
        ),

      ]);
}
