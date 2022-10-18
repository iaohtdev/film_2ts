import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_info/page/profile/profile_controller.dart';
import 'package:movie_info/widget/background_gradient.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height,
      width: Get.width,
      child: Stack(
        children: [
          const BackGroundGradient(),
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
                    dashPattern: [20, 50],
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
                      onTap: ()=>controller.goToEdit(),
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: const BoxDecoration(
                          color: Colors.black,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                            child: SvgPicture.asset(
                          "assets/icons/icon-edit.svg",
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
        itemBody('assets/icons/icon-call.svg', 'Contact Us'),
        separateLine(),
    itemBody('assets/icons/icon-policy.svg', 'Privacy Policy'),
    separateLine(),
    itemBody('assets/icons/icon-condition.svg', 'Terms and Conditions'),
    separateLine(),
    itemBody('assets/icons/icon-logout.svg', 'Logout'),
      ]);

  Widget itemBody(String icon, String title) => Padding(
    padding: const EdgeInsets.only(bottom: 10, top: 25),
    child: Row(
          children: [
            SvgPicture.asset(
              icon,
              height: 20,
              color: Colors.white,
            ),
            SizedBox(width: 20),
            Text(title,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                )),

          ],
        ),
  );

  Widget separateLine() =>
      Container(height: 2, width: Get.width, color: Colors.grey.shade500);
}
