import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_info/constants.dart';
import 'package:movie_info/page/profile/profile_controller.dart';
import 'package:movie_info/widget/icon_back.dart';

class ChangeLanguagePage extends GetView<ProfileController> {
  const ChangeLanguagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlack,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            _header(),
            Expanded(child: _body()),
          ],
        ),
      ),
    );
  }

  Widget _header() => SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: paddingHeader,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconBackWidget(),
                Text(
                  "Ngôn ngữ",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  width: 35,
                )
              ],
            ),
          ],
        ),
      );

  Widget _body() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 40,
        ),
        Expanded(child: __lstLanguage())
      ],
    );
  }

  Widget __lstLanguage() {
    return ListView.builder(
      itemCount: controller.lstLanguage.length,
      itemBuilder: (_, index) {
        return Column(
          children: [
            GestureDetector(
              onTap: () {
                controller.changeLanguage(index);
              },
              child: Obx(() => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        controller.lstLanguage[index],
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      controller.isChoose.value&&controller.indexSelected==index
                          ? Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                  color: kYellow,
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "assets/icons/icon-check.png"))),
                            )
                          : Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                  color: Colors.grey, shape: BoxShape.circle),
                            )
                    ],
                  )),
            ),
            ___separateLine()
          ],
        );
      },
    );
  }

  Widget ___separateLine() => Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Container(height: 1, width: Get.width, color: Colors.grey.shade500),
          SizedBox(
            height: 20,
          )
        ],
      );
}
