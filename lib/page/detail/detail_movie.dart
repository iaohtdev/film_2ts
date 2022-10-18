import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_info/constants.dart';
import 'package:movie_info/page/detail/components/info_movie.dart';
import 'package:movie_info/page/detail/components/lst_cast.dart';
import 'package:movie_info/page/detail/components/lst_rcm.dart';
import 'package:movie_info/page/detail/detail_controller.dart';
import 'package:movie_info/provider/api_provider.dart';
import 'package:movie_info/widget/icon_back.dart';
import 'package:movie_info/widget/ouline_paint.dart';
import 'package:movie_info/widget/rate.dart';
import 'package:palette_generator/palette_generator.dart';

class DetailMoviePage extends GetView<DetailMovieController> {
  const DetailMoviePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kBlack,
        body: FutureBuilder<String>(
          future: controller.getDataMovie(),
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                  child: Image.asset(
                "assets/gif/loading.gif",
                scale: 2,
              ));
            } else {
              if (snapshot.hasError)
                return Center(
                    child: Text(
                  "Có lỗi trong quá trình tải dữ liệu",
                  style: TextStyle(color: Colors.white),
                ));
              else
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          _banner(),
                          SafeArea(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buttonHeader(),
                              SizedBox(
                                height: 30,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  _poster(),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 90),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 20),
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
                                        ),
                                        SizedBox(
                                          height: 0,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              controller
                                                  .movieModel.value.voteAverage!
                                                  .toStringAsFixed(1)
                                                  .toString(),
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 40),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Rate(
                                                  iconSize: 15,
                                                  color: Colors.yellow,
                                                  allowHalf: true,
                                                  allowClear: true,
                                                  initialValue: controller
                                                      .movieModel
                                                      .value
                                                      .voteAverage!,
                                                  readOnly: false,
                                                ),
                                                Text(
                                                  controller.movieModel.value
                                                          .voteCount!
                                                          .toString() +
                                                      " VOTE",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.white),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              width: 60,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 30,
                              ),
                            ],
                          ))
                        ],
                      ),
                      InfoMovie(),
                      SizedBox(
                        height: 30,
                      ),
                      ListCast(),
                      SizedBox(
                        height: 30,
                      ),
                 
                      LstRecommend(),
                      SizedBox(
                        height: 100,
                      ),
                    ],
                  ),
                );
            }
          },
        ));
  }

  Padding _poster() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: FutureBuilder<PaletteGenerator>(
          future: controller.getColorFromPicture(
              '$BASE_URL${controller.movieModel.value.posterPath}'),
          builder:
              (BuildContext context, AsyncSnapshot<PaletteGenerator> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Center(
                    child: Text(
                  "",
                ));
              default:
                if (snapshot.hasError)
                  return new Text('Error: ${snapshot.error}');
                else {
                  Color colorBlur = snapshot.data!.dominantColor!.color;
                  return Container(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                        20,
                      ),
                      child: CachedNetworkImage(
                        height: 220,
                        width: 150,
                        imageUrl:
                            '$BASE_URL${controller.movieModel.value.posterPath ?? "pHkKbIRoCe7zIFvqan9LFSaQAde.jpg"}',
                        fit: BoxFit.cover,
                        placeholder: (context, url) => Container(
                          height: 220,
                          width: 150,
                          color: Colors.grey,
                        ),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0, 4),
                              color: colorBlur,
                              spreadRadius: 1,
                              blurRadius: 8)
                        ]),
                  );
                }
            }
          }),
    );
  }

  Widget _banner() {
    return Stack(
      children: [
        CachedNetworkImage(
          height: 280,
          width: double.infinity,
          imageUrl: '$BASE_URL${controller.movieModel.value.backdropPath}',
          fit: BoxFit.cover,
          placeholder: (context, url) => Container(
            height: 280,
            width: Get.width,
            color: Colors.grey,
          ),
          errorWidget: (context, url, error) => Image.asset(
            "assets/gif/loading.gif",
            height: 1,
          ),
        ),
        Container(
          height: 280,
          width: Get.width,
          color: kBlack.withOpacity(0.5),
        ),
        Positioned(
          top: 190,
          child: Container(
            height: 100,
            width: Get.width,
            decoration: BoxDecoration(
                color: Colors.red,
                gradient: LinearGradient(
                    stops: [0.1, 0.3, 0.6, 0.7, 0.9],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      kBlack.withOpacity(0.01),
                      kBlack.withOpacity(0.3),
                      kBlack.withOpacity(0.6),
                      kBlack.withOpacity(0.9),
                      kBlack
                    ])),
          ),
        ),
      ],
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
          // InkWell(
          //     onTap: () {},
          //     child: IconButton(
          //         onPressed: () {},
          //         icon: Icon(
          //           Icons.favorite_outline_rounded,
          //           color: Colors.white,
          //           size: 35,
          //         ))),
        ],
      ),
    );
  }
}
