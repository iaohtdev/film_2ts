import 'package:movie_info/page/auth/login_firebase.dart';
import 'package:movie_info/page/home/home_page_controller.dart';
import 'package:movie_info/widget/background_gradient.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_info/models/movie.dart';
import 'package:movie_info/page/home/components/masked_image.dart';
import 'package:movie_info/page/home/components/search.dart';
import 'package:movie_info/routers/app_pages.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height,
      width: Get.width,
      child: Stack(
        children: [
          const BackGroundGradient(),
          SafeArea(
            bottom: false,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: SingleChildScrollView(
                primary: true,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 24,
                    ),
                    _header(),
                    const SizedBox(
                      height: 30,
                    ),
                    const SearchFieldWidget(),
                    const SizedBox(
                      height: 39,
                    ),
                    const Text(
                      'Phim mới',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                      ),
                    ),
                    const SizedBox(
                      height: 37,
                    ),
                    SizedBox(
                      height: 160,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: newMovies.length,
                        itemBuilder: (context, index) {
                          String mask;
                          if (index == 0) {
                            mask = "assets/images/mask_firstIndex.png";
                          } else if (index == newMovies.length - 1) {
                            mask = "assets/images/mask_lastIndex.png";
                          } else {
                            mask = "assets/images/mask.png";
                          }
                          return InkWell(
                            onTap: (() {
                              Get.toNamed(Routes.detailpage);
                            }),
                            child: SizedBox(
                              height: 160,
                              width: 142,
                              child: MaskedImage(
                                asset: newMovies[index].moviePoster,
                                mask: mask,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 38,
                    ),
                    const Text(
                      'Phim phổ biến',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                      ),
                    ),
                    const SizedBox(
                      height: 37,
                    ),
                    SizedBox(
                      height: 160,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: upcomingMovies.length,
                        itemBuilder: (context, index) {
                          String mask;
                          if (index == 0) {
                            mask = "assets/images/mask_firstIndex.png";
                          } else if (index == upcomingMovies.length - 1) {
                            mask = "assets/images/mask_lastIndex.png";
                          } else {
                            mask = "assets/images/mask.png";
                          }
                          return GestureDetector(
                            onTap: () {
                              Get.toNamed(Routes.detailpage);
                            },
                            child: SizedBox(
                              height: 160,
                              width: 142,
                              child: MaskedImage(
                                asset: upcomingMovies[index].moviePoster,
                                mask: mask,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 38,
                    ),
                    const Text(
                      'Phim sắp chiếu',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                      ),
                    ),
                    const SizedBox(
                      height: 37,
                    ),
                    SizedBox(
                      height: 160,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: upcomingMovies.length,
                        itemBuilder: (context, index) {
                          String mask;
                          if (index == 0) {
                            mask = "assets/images/mask_firstIndex.png";
                          } else if (index == upcomingMovies.length - 1) {
                            mask = "assets/images/mask_lastIndex.png";
                          } else {
                            mask = "assets/images/mask.png";
                          }
                          return GestureDetector(
                            onTap: () {
                              Get.toNamed(Routes.detailpage);
                            },
                            child: SizedBox(
                              height: 160,
                              width: 142,
                              child: MaskedImage(
                                asset: upcomingMovies[index].moviePoster,
                                mask: mask,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Row _header() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 7,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Xin chào, ',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Obx(() => Text(
                    controller.userModel.value.name ?? "User Name",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 28,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  )),
            ],
          ),
        ),
        Expanded(
            child: InkWell(
          onTap: () {
            FirebaseFunction().signOut();
          },
          child: Container(
            height: 40,
            width: 40,
            decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage("assets/images/poster_2.jpg"),
                    fit: BoxFit.cover)),
          ),
        ))
      ],
    );
  }
}
