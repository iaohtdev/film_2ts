import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:movie_info/constants.dart';
import 'package:movie_info/page/favorite/favorite_page.dart';
import 'package:movie_info/page/home/home_page.dart';
import 'package:movie_info/page/navigation_bar/navigation_controller.dart';
import 'package:movie_info/page/nofication/nofication_page.dart';

class NavigationBarWidget extends GetView<NavigationBarController> {
  const NavigationBarWidget({Key? key}) : super(key: key);

  static const List<Widget> _lstPage = <Widget>[
    HomePage(),
    FavoritePage(),
    NoficationPage(),
    // ProfilePage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlack,
      body: _body(),
      bottomNavigationBar: _bottomNavibar(),
    );
  }

  Widget _body() {
    return Obx(() => _lstPage.elementAt(controller.selectedIndex.value));
  }

  Widget _bottomNavibar() {
    return Stack(
      children: [
        Container(
          height: 75,
          color: kBlack,
        ),
        Container(
            height: 75,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [kLightGreen.withOpacity(0.3), kBlack.withOpacity(0.1)],
              ),
            ),
            child: Obx(
              () => BottomNavigationBar(
                type: BottomNavigationBarType.fixed ,
                currentIndex: controller.selectedIndex.value,
                onTap: controller.ontapNavi,
                backgroundColor: Colors.transparent,
//
                items: [
                  BottomNavigationBarItem(
                    icon: controller.selectedIndex.value == 0
                        ? SvgPicture.asset(
                            "assets/icons/icon-home.svg",
                            height: 25,
                            color: Colors.white,
                          )
                        : SvgPicture.asset(
                            "assets/icons/icon-home-outline.svg",
                            height: 35,
                            color: Colors.white,
                          ),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: controller.selectedIndex.value == 1
                        ? SvgPicture.asset(
                            "assets/icons/icon-favorite.svg",
                            height: 40,
                            color: Colors.white,
                          )
                        : SvgPicture.asset(
                            "assets/icons/icon-favorite_outline.svg",
                            height: 40,
                            color: Colors.white,
                          ),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: controller.selectedIndex.value == 2
                        ? SvgPicture.asset(
                            "assets/icons/icon-nofi.svg",
                            height: 40,
                            color: Colors.white,
                          )
                        : SvgPicture.asset(
                            "assets/icons/icon-nofi_outline.svg",
                            height: 40,
                            color: Colors.white,
                          ),
                    label: '',
                  ),
                  // BottomNavigationBarItem(
                  //   icon: controller.selectedIndex.value == 3
                  //       ? SvgPicture.asset(
                  //           "assets/icons/icon-profile.svg",
                  //           height: 25,
                  //           color: Colors.white,
                  //         )
                  //       : SvgPicture.asset(
                  //           "assets/icons/icon-profile_outline.svg",
                  //           height: 25,
                  //           color: Colors.white,
                  //         ),
                  //   label: '',
                  // ),
                ],
              ),
            )),
      ],
    );
  }
}
