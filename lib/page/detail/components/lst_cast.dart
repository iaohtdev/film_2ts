
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_info/constants.dart';
import 'package:movie_info/page/detail/detail_controller.dart';
import 'package:movie_info/provider/api_provider.dart';

class ListCast extends GetView<DetailMovieController> {
  const ListCast({
    Key? key,
   
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Diễn viên",
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Container(
            height: 90,
            child: ListView.builder(
                itemCount: controller.lstCast.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
            margin: EdgeInsets.symmetric(horizontal: 10),

                        height: 60,
                        width: 60,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: CachedNetworkImage(
                            height: 60,
                            width: double.infinity,
                            imageUrl:
                                '$BASE_URL${controller.lstCast[index].profilePath}',
                            fit: BoxFit.cover,
                            placeholder: (context, url) => Container(
                              height: 60,
                              width: Get.width,
                              color: kBlack.withOpacity(0.5),
                            ),
                            errorWidget: (context, url, error) => Container(
                              color: Colors.grey,

                              child: Icon(Icons.error_outline,))
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        controller.lstCast[index].name ?? "Name",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  );
                }),
          )
        ],
      ),
    );
  }
}
