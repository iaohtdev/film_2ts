import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:movie_info/constants.dart';
import 'package:movie_info/page/search/search_controller.dart';
import 'package:movie_info/provider/api_provider.dart';

class SearchPage extends GetView<SearchController> {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlack,
      body: SafeArea(
        child: Obx(() => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _seach(),
                Expanded(
                    child: controller.isSearch.value == false
                        ? _lstTopSearch()
                        : _lstResults())
              ],
            )),
      ),
    );
  }

  Widget _lstResults() {
    return Obx(() => controller.isLoading.value
        ? Center(
            child: Image.asset(
              "assets/gif/loading.gif",
              scale: 2.5,
            ),
          )
        : Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
            child: controller.lstSearchMovie.length==0 ?Center(
              child: Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Rất tiếc! Chúng tôi chưa có nội dung đó",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white,fontSize:22,fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10,),
                    Text(
                    "Hãy thử tìm lại bộ phim, chương trình khác",
                    textAlign: TextAlign.center,

                    style: TextStyle(color: Colors.white.withOpacity(0.6)),
                  ),
                ],
              ),
            ) : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Kết quả tìm kiếm",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                 Expanded(
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: controller.lstSearchMovie.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                                onTap: () {
                                  controller.ontapMovie(
                                      controller.lstSearchMovie[index].id!);
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
                                            imageUrl:
                                                '$BASE_URL${controller.lstSearchMovie[index].posterPath}',
                                            fit: BoxFit.fitWidth,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                          child: Text(
                                        controller
                                                .lstSearchMovie[index].title ??
                                            "Name",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16),
                                      ))
                                    ],
                                  ),
                                ));
                          },
                        ),
                      ),
              ],
            ),
          ));
  }

  Widget _lstTopSearch() {
    return Obx(() => Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Tìm kiếm hàng đầu",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: controller.lstPopular.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                        onTap: () {
                          controller
                              .ontapMovie(controller.lstPopular[index].id!);
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
                                    imageUrl: BASE_URL +
                                        controller
                                            .lstPopular[index].backdropPath!,
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: Text(
                                controller.lstPopular[index].title ?? "Name",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ))
                            ],
                          ),
                        ));
                  },
                ),
              ),
            ],
          ),
        ));
  }

  Widget _seach() {
    return Padding(
      padding: const EdgeInsets.only(top: 20, right: 20, bottom: 20),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () => Get.back(),
              child: SvgPicture.asset(
                "assets/icons/icon-back.svg",
                height: 18,
                color: Colors.white,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              height: 35,
              decoration: BoxDecoration(
                color: kGrey.withOpacity(0.3),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Obx(() => Row(
                    children: [
                      const SizedBox(
                        width: 8,
                      ),
                      GestureDetector(
                        onTap: () => controller.searchFunction(
                            controller.textEditingController.text),
                        child: SvgPicture.asset(
                          "assets/icons/icon-search.svg",
                          height: 18,
                          color: Colors.white.withOpacity(0.6),
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Expanded(
                          child: TextField(
                        autofocus: false,
                        controller: controller.textEditingController,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          letterSpacing: -0.41,
                        ),
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                          suffixIconConstraints:
                              BoxConstraints(maxHeight: 30, maxWidth: 30),
                          suffixIcon: controller.isSearch.value
                              ? Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  child: GestureDetector(
                                    onTap: () {
                                      controller.ontapClear();
                                    },
                                    child: Icon(
                                      Icons.cancel,
                                      color: Colors.white.withOpacity(0.6),
                                    ),
                                  ))
                              : Container(),
                          hintText: 'Tìm kiếm',
                          border: InputBorder.none,
                          isDense: true,
                          hintStyle: TextStyle(
                            color: Colors.white.withOpacity(0.6),
                            fontSize: 14,
                            letterSpacing: -0.41,
                          ),
                        ),
                        onChanged: (value) => controller.onChanged(value),
                        onSubmitted: (value) =>
                            controller.searchFunction(value),
                      )),
                    ],
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
