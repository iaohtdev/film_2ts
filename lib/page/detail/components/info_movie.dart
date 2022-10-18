import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:movie_info/constants.dart';
import 'package:movie_info/page/detail/detail_controller.dart';

class InfoMovie extends GetView<DetailMovieController> {
  const InfoMovie({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            controller.movieModel.value.title != ""
                ? controller.movieModel.value.title ?? "Tên film"
                : "",
            style: TextStyle(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Image.asset(
                "assets/icons/icon-location.png",
                color: Colors.white,
                height: 20,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                controller.movieModel.value.productionCountries![0].name!,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Row(
                children: [
                  Image.asset(
                    "assets/icons/icon-date.png",
                    color: Colors.white,
                    height: 20,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    DateFormat('dd-MM-yyyy')
                        .format(DateTime.parse(
                            controller.movieModel.value.releaseDate!))
                        .toString(),
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              SizedBox(
                width: 60,
              ),
              Row(
                children: [
                  Image.asset(
                    "assets/icons/icon-time.png",
                    color: Colors.white,
                    height: 20,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    minutesToHours(controller.movieModel.value.runtime!)
                        .toString(),
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _itemButton(Icons.add_box_outlined),
              _itemButton(Icons.favorite_outline_rounded),
              _itemButton(Icons.bookmark_outline_outlined),
              _itemButton(Icons.share_outlined),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Nội dung",
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            controller.movieModel.value.overview != ""
                ? controller.movieModel.value.overview ?? "Không có  mô tả phim"
                : "Không có  mô tả phim",
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
          SizedBox(height: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Thể loại",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Wrap(
                  direction: Axis.horizontal,
                  children: controller.movieModel.value.genres!.map((e) {
                    var item = Container(
                      margin: EdgeInsets.only(right: 5, bottom: 5),
                      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                      decoration: BoxDecoration(
                          border: Border.all(color: kPurple, width: 2),
                          borderRadius: BorderRadius.circular(5)),
                      child: Text(
                        e.name!,
                        style: TextStyle(color: Colors.white),
                      ),
                    );

                    return item;
                  }).toList()),
            ],
          ),
        ],
      ),
    );
  }

  Container _itemButton(IconData icon) {
    return Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.5),
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                  color: kBlack.withOpacity(0.9),
                  offset: Offset(2, 0),
                  blurRadius: 1,
                  spreadRadius: 2)
            ],
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  kPink.withOpacity(0.5),
                  kLightGreen.withOpacity(0.5)
                ])),
        child: Icon(
          icon,
          color: Colors.white,
          size: 30,
        ));
  }
}
