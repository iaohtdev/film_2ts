import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_info/page/detail/detail_controller.dart';
import 'package:movie_info/provider/api_provider.dart';
import 'package:movie_info/routers/app_pages.dart';

class LstRecommend extends GetView<DetailMovieController> {
  const LstRecommend({
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
            "Gợi ý cho bạn",
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          controller.lstRcm.length != 0
              ? SizedBox(
                  height: 200,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.lstRcm.length,
                    itemBuilder: (context, index) {
                    
                      return GestureDetector(
                        onTap: (() {
                          Get.offAllNamed(Routes.detailpage,arguments: controller.lstRcm[index].id);
                        }),
                        child: Column(
                          children: [
                            Container(
                              height: 180,
                              width: 110,
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: CachedNetworkImage(
                                  width: double.infinity,
                                  imageUrl:
                                      '$BASE_URL${controller.lstRcm[index].posterPath}',
                                  fit: BoxFit.cover,
                                  placeholder: (context, url) => Container(
                                    width: Get.width,
                                    color: Colors.grey,
                                  ),
                                  errorWidget: (context, url, error) =>
                                      Image.asset(
                                    "assets/gif/loading.gif",
                                    height: 1,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                )
              : Center(
                  child: Text(
                    "Không có bộ film nào để gợi ý",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
