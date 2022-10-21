import 'package:cached_network_image/cached_network_image.dart';
import 'package:movie_info/constants.dart';
import 'package:movie_info/models/movie.dart';
import 'package:movie_info/models/tv.dart';
import 'package:movie_info/page/home/home_page_controller.dart';
import 'package:movie_info/provider/api_provider.dart';
import 'package:movie_info/routers/app_pages.dart';
import 'package:movie_info/widget/background_gradient.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_info/page/home/components/search.dart';
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
              child: FutureBuilder<String>(
                  future: controller.fechData(),
                  builder:
                      (BuildContext context, AsyncSnapshot<String> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                          child: Image.asset(
                        "assets/gif/loading.gif",
                        scale: 2,
                      ));
                    } else if (snapshot.hasError) {
                      return Center(
                          child: Text(
                        "Có lỗi trong quá trình tải dữ liệu",
                        style: TextStyle(color: Colors.white),
                      ));
                    } else
                      return SingleChildScrollView(
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
                              height: 35,
                            ),
                            _lstMovie(
                                lst: controller.lstPopular, title: 'Phổ biến'),

                            _lstMovie(
                                lst: controller.lstNowPlaying,
                                title: "Đang chiếu tại rap"),

                            _lstMovie(
                                lst: controller.lstTopRate,
                                title: "Phim có xếp hạng cao"),
                            _lstMovie(
                                lst: controller.lstUpComing,
                                title: "Sắp chiếu"),
                                 _lstTv(
                                title: "Seri phim phổ biến",
                                lst: controller.lstTvPopular),
                                  _lstTv(
                                title: "Seri phim có xếp hạng cao",
                                lst: controller.lstTvTopRate),
                           
                   
                           
                            const SizedBox(
                              height: 20,
                            ),
                            // _lstUpComing(),
                            const SizedBox(
                              height: 100,
                            ),
                          ],
                        ),
                      );
                  }),
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
           Get.toNamed(Routes.profile,arguments: controller.userModel.value);
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

  Column _lstMovie({required String title, required List<MovieModel> lst}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 160,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: lst.length,
            itemBuilder: (context, index) {
              String mask;
              if (index == 0) {
                mask = "assets/images/mask_firstIndex.png";
              } else if (index == lst.length - 1) {
                mask = "assets/images/mask_lastIndex.png";
              } else {
                mask = "assets/images/mask.png";
              }
              return InkWell(
                onTap: (() {
                  controller.ontapMovie(lst[index].id!);
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
                            BASE_URL + lst[index].posterPath!,
                            fit: BoxFit.cover,
                          ),
                          child: Image.asset(mask)),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }

  Column _lstTv({required String title, required List<TvSeriModel> lst}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 220,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: lst.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: (() {
                  controller.ontapMovie(lst[index].id!);
                }),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: CachedNetworkImage(
                          height: 220,
                          width: 150,
                          imageUrl: '$BASE_URL${lst[index].posterPath}',
                          fit: BoxFit.cover,
                          placeholder: (context, url) => Container(
                            height: 220,
                            width: 150,
                            color: kBlack.withOpacity(0.5),
                          ),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
