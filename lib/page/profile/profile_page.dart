import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_info/constants.dart';
import 'package:movie_info/page/auth/login_firebase.dart';
import 'package:movie_info/page/profile/components/privacy.dart';
import 'package:movie_info/page/profile/components/terms.dart';
import 'package:movie_info/page/profile/profile_controller.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_info/widget/icon_back.dart';
import 'package:movie_info/widget/ouline_paint.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: SingleChildScrollView(
            child: Column(
              children: [
                _header(),
                SizedBox(height: 24),
                _body(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _header() => SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
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
                  "Tài khoản",
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
            SizedBox(height: 50),
            CustomOutlineButton(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    kPink,
                    kPink.withOpacity(0.7),
                    kLightGreen.withOpacity(0.7),
                    kLightGreen
                  ],
                  stops: const [
                    0.2,
                    0.4,
                    0.6,
                    1
                  ]),
              radius: Get.width * 0.8,
              strokeWidth: 2.5,
              child: Container(
                margin: EdgeInsets.all(5),
                height: 150,
                width: 150,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage("assets/images/logo.png"),
                        fit: BoxFit.cover)),
              ),
            ),
          ],
        ),
      );

  Widget _body() =>
      Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Text(controller.userModel.value.name??"Name ",
            style: TextStyle(
              fontSize: 22,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            )),
        SizedBox(height: 8),
        Text('@username',
            style: TextStyle(
              fontSize: 12,
              color: Colors.white,
              fontWeight: FontWeight.w200,
            )),
        itemBody('assets/icons/icon-profile_outline.svg', 'Thông tin tài khoản',
            ontap: () {
          controller.goToEdit();
        }),
        itemBody('assets/icons/icon-favorite.svg', 'Danh sách yêu thích',
            ontap: () {}),
        separateLine(),
        itemBody('assets/icons/icon-policy.svg', 'Chính sách bảo mật',
            ontap: () {

               Get.to(()=>PrivacyPage());
            }),
        itemBody(
            'assets/icons/icon-condition.svg', 'Các điều khoản và điều kiện',
            
            ontap: (){
                 Get.to(()=>TermsOfUse());
            }
            ),
        separateLine(),
        _itemLanguage('assets/icons/icon-language.svg', 'Ngôn ngữ'),
        itemBody('assets/icons/icon-logout.svg', 'Đăng xuất', ontap: () {
          FirebaseFunction().signOut();
        }),
      ]);

  Widget itemBody(String icon, String title, {Function()? ontap}) => Padding(
        padding: const EdgeInsets.only(bottom: 10, top: 10),
        child: GestureDetector(
          onTap: ontap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(8)),
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: SvgPicture.asset(
                        icon,
                        color: Colors.white,
                      ),
                    ),
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
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(8)),
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: SvgPicture.asset(
                    "assets/icons/icon-arrow-right.svg",
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      );

  _itemLanguage(String icon, String title, {Function()? ontap}) => Padding(
        padding: const EdgeInsets.only(bottom: 10, top: 10),
        child: GestureDetector(
          onTap: ontap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(8)),
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: SvgPicture.asset(
                        icon,
                        color: Colors.white,
                      ),
                    ),
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
              Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        color: Colors.red, shape: BoxShape.circle),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(8)),
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: SvgPicture.asset(
                        "assets/icons/icon-arrow-right.svg",
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );

  Widget separateLine() => Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Container(height: 1, width: Get.width, color: Colors.grey.shade500),
          SizedBox(
            height: 10,
          )
        ],
      );
}
