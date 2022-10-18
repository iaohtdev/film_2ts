import 'package:movie_info/page/auth/login_firebase.dart';
import 'package:movie_info/page/home/home_page_controller.dart';
import 'package:movie_info/provider/api_provider.dart';
import 'package:movie_info/widget/background_gradient.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_info/models/movie.dart';
import 'package:movie_info/page/home/components/masked_image.dart';
import 'package:movie_info/page/home/components/search.dart';
import 'package:movie_info/routers/app_pages.dart';
import 'package:widget_mask/widget_mask.dart';

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
                    _lstPopular(),
                    const SizedBox(
                      height: 38,
                    ),
                  //  _lstRating(),
                    const SizedBox(
                      height: 38,
                    ),
                  // _lstUpComing(),
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

//   Column _lstUpComing() {
//     return Column(children: [
// const Text(
//                     'Phim sắp chiếu',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 17,
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 37,
//                   ),
//                   SizedBox(
//                     height: 160,
//                     child: ListView.builder(
//                       shrinkWrap: true,
//                       scrollDirection: Axis.horizontal,
//                       itemCount: upcomingMovies.length,
//                       itemBuilder: (context, index) {
//                         String mask;
//                         if (index == 0) {
//                           mask = "assets/images/mask_firstIndex.png";
//                         } else if (index == upcomingMovies.length - 1) {
//                           mask = "assets/images/mask_lastIndex.png";
//                         } else {
//                           mask = "assets/images/mask.png";
//                         }
//                         return GestureDetector(
//                           onTap: () {
//                             Get.toNamed(Routes.detailpage);
//                           },
//                           child: SizedBox(
//                             height: 160,
//                             width: 142,
//                             child: MaskedImage(
//                               asset: upcomingMovies[index].moviePoster,
//                               mask: mask,
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                   ),
                
//                 ],);
//   }

//   Column _lstRating() {
//     return Column(children: [
//  const Text(
//                     'Phim phổ biến',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 17,
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 37,
//                   ),
//                   SizedBox(
//                     height: 160,
//                     child: ListView.builder(
//                       shrinkWrap: true,
//                       scrollDirection: Axis.horizontal,
//                       itemCount: upcomingMovies.length,
//                       itemBuilder: (context, index) {
//                         String mask;
//                         if (index == 0) {
//                           mask = "assets/images/mask_firstIndex.png";
//                         } else if (index == upcomingMovies.length - 1) {
//                           mask = "assets/images/mask_lastIndex.png";
//                         } else {
//                           mask = "assets/images/mask.png";
//                         }
//                         return GestureDetector(
//                           onTap: () {
//                             Get.toNamed(Routes.detailpage);
//                           },
//                           child: SizedBox(
//                             height: 160,
//                             width: 142,
//                             child: MaskedImage(
//                               asset: upcomingMovies[index].moviePoster,
//                               mask: mask,
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                   ),
                 
//                  ],);
//   }

  Column _lstPopular() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Phổ biến',
          style: TextStyle(
            color: Colors.white,
            fontSize: 17,
          ),
        ),
        const SizedBox(
          height: 37,
        ),
        Obx(() => SizedBox(
              height: 160,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: controller.lstPopular.length,
                itemBuilder: (context, index) {
                  String mask;
                  if (index == 0) {
                    mask = "assets/images/mask_firstIndex.png";
                  } else if (index == controller.lstPopular.length - 1) {
                    mask = "assets/images/mask_lastIndex.png";
                  } else {
                    mask = "assets/images/mask.png";
                  }
                  return InkWell(
                    onTap: (() {
                    controller.ontapMovie(controller.lstPopular[index].id!);
                    }),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 160,
                          width: 142,
                          child: WidgetMask(
                              blendMode: BlendMode.srcATop,
                              childSaveLayer: true,
                              mask: Image.network(
                                BASE_URL +
                                    controller.lstPopular[index].posterPath!,
                                fit: BoxFit.cover,
                              ),
                              child: Image.asset(mask)),
                        ),
                      ],
                    ),
                  );
                },
              ),
            )),
      ],
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
