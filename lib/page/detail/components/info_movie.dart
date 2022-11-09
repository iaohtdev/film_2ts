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
              controller.movieModel.value.productionCountries == null
                  ? Text(
                      "Country",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    )
                  : Text(
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
                  controller.movieModel.value.releaseDate == null
                      ? Text(
                          "11-11-2022",
                          style: TextStyle(color: Colors.white),
                        )
                      : Text(
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
                    minutesToHours(controller.movieModel.value.runtime ?? 1)
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
          Text(
            "Nội dung",
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            controller.movieModel.value.overview != ""
                ? controller.movieModel.value.overview ?? "Đang cập nhật mô tả phim"
                : "Đang cập nhật mô tả phim",
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
              controller.movieModel.value.genres == null
                  ? Text(
                      "Đang cập nhật",
                      style: TextStyle(color: Colors.white),
                    )
                  : Wrap(
                      direction: Axis.horizontal,
                      children: controller.movieModel.value.genres!.map((e) {
                        var item = Container(
                          margin: EdgeInsets.only(right: 5, bottom: 5),
                          padding:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 3),
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
}
