import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_info/constants.dart';
import 'package:movie_info/page/favorite/favorite_controller.dart';
import 'package:movie_info/provider/api_provider.dart';
import 'package:movie_info/widget/background_gradient.dart';
import 'package:movie_info/widget/icon_back.dart';

// ignore: must_be_immutable
class FavoritePage extends GetView<FavoriteController> {
  FavoritePage({Key? key, this.isNavipage = false}) : super(key: key);
  bool? isNavipage;
  @override
  Widget build(BuildContext context) {
    return isNavipage == true
        ? Scaffold(
            backgroundColor: kBlack,
            body: SizedBox(
              height: Get.height,
              width: Get.width,
              child: Stack(
                children: [
                  const BackGroundGradient(),
                  SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        _header(),
                          StreamBuilder<QuerySnapshot>(
                              stream: FirebaseFirestore.instance
                                  .collection("favorite")
                                  .doc(FirebaseAuth.instance.currentUser!.email)
                                  .collection("items")
                                  .snapshots(),
                              builder: (BuildContext context,
                                  AsyncSnapshot<QuerySnapshot> snapshot) {
                                if (!snapshot.hasData)
                                  return Text("Error");
                                else if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return Column(
                                    children: [
                                      SizedBox(
                                        height: Get.height / 3,
                                      ),
                                      Center(
                                        child: Image.asset(
                                          "assets/gif/loading.gif",
                                          scale: 3,
                                        ),
                                      ),
                                    ],
                                  );
                                } else if (snapshot.data!.docs.length == 0) {
                                  return Column(
                                    children: [
                                      SizedBox(
                                        height: Get.height / 3.5,
                                      ),
                                      Text(
                                        "Bạn chưa thêm phim nào vào mục danh sách yêu thích",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  );
                                } else {
                                  return Column(
                                    children: lstMovie(snapshot),
                                  );
                                }
                              }),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        : SizedBox(
            height: Get.height,
            width: Get.width,
            child: Stack(
              children: [
                const BackGroundGradient(),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 40,
                        ),
                        Text(
                          'Danh sách yêu thích',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        StreamBuilder<QuerySnapshot>(
                            stream: FirebaseFirestore.instance
                                .collection("favorite")
                                .doc(FirebaseAuth.instance.currentUser!.email)
                                .collection("items")
                                .snapshots(),
                            builder: (BuildContext context,
                                AsyncSnapshot<QuerySnapshot> snapshot) {
                              if (!snapshot.hasData)
                                return Text("Error");
                              else if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return Column(
                                  children: [
                                    SizedBox(
                                      height: Get.height / 3,
                                    ),
                                    Center(
                                      child: Image.asset(
                                        "assets/gif/loading.gif",
                                        scale: 3,
                                      ),
                                    ),
                                  ],
                                );
                              } else if (snapshot.data!.docs.length == 0) {
                                return Column(
                                  children: [
                                    SizedBox(
                                      height: Get.height / 3.5,
                                    ),
                                    Text(
                                      "Bạn chưa thêm phim nào vào mục danh sách yêu thích",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ],
                                );
                              } else {
                                return Column(
                                  children: lstMovie(snapshot),
                                );
                              }
                            }),
                      ],
                    ),
                  ),
                ),
              ],
            ));
  }
  Widget _header() => SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                  "Danh sách phim yêu thích",
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
           
         
          ],
        ),
      );
  lstMovie(AsyncSnapshot<QuerySnapshot> snapshot) {
    return snapshot.data!.docs
        .map((doc) => InkWell(
              onTap: () {
                controller.ontapMovie(doc["id"]);
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 3),
                height: 80,
                width: Get.width,
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Container(
                        width: 140,
                        child: CachedNetworkImage(
                          imageUrl: '$BASE_URL${doc["image"]}',
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: Text(
                      doc["name"] ?? "Name",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ))
                  ],
                ),
              ),
            ))
        .toList();
  }
}
