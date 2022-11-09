import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:movie_info/constants.dart';
import 'package:movie_info/page/detail/components/info_movie.dart';
import 'package:movie_info/page/detail/components/lst_cast.dart';
import 'package:movie_info/page/detail/components/lst_rcm.dart';
import 'package:movie_info/page/detail/components/play_trailer.dart';
import 'package:movie_info/page/detail/detail_controller.dart';
import 'package:movie_info/provider/api_provider.dart';
import 'package:movie_info/routers/app_pages.dart';
import 'package:movie_info/widget/icon_back.dart';
import 'package:movie_info/widget/ouline_paint.dart';
import 'package:movie_info/widget/rate.dart';
import 'package:palette_generator/palette_generator.dart';

class DetailMoviePage extends GetView<DetailMovieController> {
  const DetailMoviePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.movieModel.value.voteAverage =0.0;
    return Scaffold(
        backgroundColor: kBlack,
        body: GetBuilder<DetailMovieController>(
          init: DetailMovieController(),
          initState: (_) {},
          builder: (_) {
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
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  _poster(),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 90),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(right: 20),
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
                                            ]),
                                      ),
                                      child: IconButton(
                                          onPressed: () {
                                            Get.lazyPut(
                                                () => PlayTrailerController());
                                            Get.to(
                                              () => PlayTrailerPage(id: controller.movieModel.value.id,),
                                              arguments: controller
                                                  .trailerModel.value.key
                                            );
                                          },
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
                                      controller.movieModel.value.voteAverage 
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
                                              .movieModel.value.voteAverage,
                                          readOnly: false,
                                        ),
                                        Text(
                                          controller.movieModel.value.voteCount
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
        );})          
        )    ;
  }

  Padding _poster() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                 offset: Offset(0, 4),
                              color: kBlack,
                              spreadRadius: 1,
                              blurRadius: 8
              )
            ]
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
                              color: kBlack.withOpacity(0.5),
                            ),
                            errorWidget: (context, url, error) => Icon(Icons.error),
                          ),
        ),
      ),
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
              Get.offAllNamed(Routes.navigationbar);
            },
            child: Container(
                      
                      child: SvgPicture.asset(
                        'assets/icons/icon-back.svg',
                       color: Colors.white,
                       height: 30,
                      ),
                    ),
          ),
          Row(
            children: [
              StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection("favorite")
                    .doc(FirebaseAuth.instance.currentUser!.email)
                    .collection("items")
                    .where("id", isEqualTo: controller.movieModel.value.id)
                    .snapshots(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.data == null) {
                    return Text("");
                  }
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: IconButton(
                      onPressed: () => snapshot.data.docs.length == 0
                          ? controller.addFavorite()
                          : print("already added"),
                      icon: snapshot.data.docs.length == 0
                          ? Icon(
                              Icons.favorite_outline,
                              color: Colors.white,
                              size: 30,
                            )
                          : Icon(
                              Icons.favorite,
                              color: Colors.red,
                              size: 30,
                            ),
                    ),
                  );
                },
              ),
              __itemButton(
                  icon: Icon(
                    Icons.share_outlined,
                    size: 30,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    controller.share();
                  }),
            ],
          )
        ],
      ),
    );
  }

  Widget __itemButton({required Widget icon, Function()? onPressed}) {
    return IconButton(
      color: Colors.white,
      icon: icon,
      onPressed: onPressed,
    );
  }
}
