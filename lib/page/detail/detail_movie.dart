import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_info/constants.dart';
import 'package:movie_info/page/detail/detail_controller.dart';
import 'package:movie_info/provider/api_provider.dart';
import 'package:movie_info/widget/icon_back.dart';
import 'package:movie_info/widget/ouline_paint.dart';
import 'package:palette_generator/palette_generator.dart';

class DetailMoviePage extends GetView<DetailMovieController> {
  const DetailMoviePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kBlack,
        body: FutureBuilder<String>(
          future: controller.getDetailMovie(),
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                  child: Image.asset(
                "assets/gif/loading.gif",
                scale: 2,
              ));
            } else {
              if (snapshot.hasError)
                return Center(child: Text('Error: ${snapshot.error}'));
              else
                return Stack(
                  children: [
                    _banner(),
                    Container(
                      height: 280,
                      width: Get.width,
                    ),
                    SingleChildScrollView(
                      child: SafeArea(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buttonHeader(),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: FutureBuilder<PaletteGenerator>(
                                    future: controller.getColorFromPicture(
                                        '$BASE_URL${controller.movieModel.value.posterPath}'),
                                    builder: (BuildContext context,
                                        AsyncSnapshot<PaletteGenerator>
                                            snapshot) {
                                      switch (snapshot.connectionState) {
                                        case ConnectionState.waiting:
                                          return Center(
                                              child: Image.asset(
                                            "assets/gif/loading.gif",
                                           scale: 10,
                                          ));
                                        default:
                                          if (snapshot.hasError)
                                            return new Text(
                                                'Error: ${snapshot.error}');
                                          else {
                                            Color colorBlur = snapshot
                                                .data!.dominantColor!.color;
                                            return Container(
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                  20,
                                                ),
                                                child: CachedNetworkImage(
                                                  height: 220,
                                                  width: 150,
                                                  imageUrl:
                                                      '$BASE_URL${controller.movieModel.value.posterPath ?? "pHkKbIRoCe7zIFvqan9LFSaQAde.jpg"}',
                                                  fit: BoxFit.cover,
                                                  placeholder: (context, url) =>
                                                      Image.asset(
                                                    "assets/gif/loading.gif",
                                                    scale: 2,
                                                  ),
                                                  errorWidget:
                                                      (context, url, error) =>
                                                          Icon(Icons.error),
                                                ),
                                              ),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color: colorBlur,
                                                        spreadRadius: 1,
                                                        blurRadius: 8)
                                                  ]),
                                            );
                                          }
                                      }
                                    }),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(right: 30, top: 60),
                                child: CustomOutlineButton(
                                  strokeWidth: 3,
                                  radius: 30,
                                  gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [kPink, kLightGreen],
                                  ),
                                  child: Container(
                                    height: 60,
                                    width: 60,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      gradient: LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        colors: [
                                          kPink.withOpacity(0.4),
                                          kLightGreen.withOpacity(0.4)
                                        ],
                                      ),
                                      // boxShadow: [
                                      //   BoxShadow(
                                      //       color: kPink.withOpacity(0.2),
                                      //       blurRadius: 8,
                                      //       spreadRadius: 2)
                                      // ]
                                    ),
                                    child: IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.play_arrow,
                                          color: Colors.white,
                                          size: 40,
                                        )),
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Container(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.star_rate_rounded,
                                        color: Colors.yellow,
                                      ),
                                      Text(
                                        controller.movieModel.value.voteAverage!
                                            .toStringAsFixed(1)
                                            .toString(),
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      Text(
                                        " / " +
                                            controller
                                                .movieModel.value.voteCount!
                                                .toString() +
                                            " vote",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Icon(
                                        Icons.favorite_outline_rounded,
                                        color: Colors.white,
                                      ),
                                      Icon(
                                        Icons.share_outlined,
                                        color: Colors.white,
                                      ),
                                      Icon(
                                        Icons.bookmark_outline,
                                        color: Colors.white,
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            controller.movieModel.value.releaseDate.toString(),
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            minutesToHours(controller.movieModel.value.runtime!)
                                .toString(),
                            style: TextStyle(color: Colors.white),
                          ),
                          Wrap(
                              direction: Axis.horizontal,
                              children:
                                  controller.movieModel.value.genres!.map((e) {
                                var item = Container(
                                  margin:EdgeInsets.only(right: 10) ,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 3),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.white,
                                    ),
                                    borderRadius: BorderRadius.circular(5)),
                                child: Text(
                                  e.name!,
                                  style: TextStyle(color: Colors.white),
                                ),
                                );

                                return item;
                              }).toList()),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  controller.movieModel.value.title != ""
                                      ? controller.movieModel.value.title ??
                                          "Tên film"
                                      : "",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  controller.movieModel.value.overview != ""
                                      ? controller.movieModel.value.overview ??
                                          "Không có  mô tả phim"
                                      : "Không có  mô tả phim",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      )),
                    )
                  ],
                );
            }
          },
        ));
  }

  lstGenres() {
    List<dynamic> lst = [];
    List lstGenres = controller.movieModel.value.genres!.map((e) {
      return Text(e.name!);
    }).toList();
    lst.addAll(lstGenres);
    return lstGenres;
  }

  CachedNetworkImage _banner() {
    return CachedNetworkImage(
      height: 280,
      width: double.infinity,
      imageUrl: '$BASE_URL${controller.movieModel.value.backdropPath}',
      fit: BoxFit.cover,
      placeholder: (context, url) => Image.asset(
        "assets/gif/loading.gif",
        scale: 2,
      ),
      errorWidget: (context, url, error) => Image.asset(
        "assets/gif/loading.gif",
        height: 1,
      ),
    );
  }

  Padding _buttonHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              Get.back();
            },
            child: IconBackWidget(),
          ),
          InkWell(
              onTap: () {},
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.favorite_outline_rounded,
                    color: Colors.white,
                    size: 35,
                  ))),
        ],
      ),
    );
  }
}
