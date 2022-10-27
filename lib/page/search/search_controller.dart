import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:movie_info/models/movie.dart';
import 'package:movie_info/provider/api_provider.dart';
import 'package:movie_info/routers/app_pages.dart';

class SearchController extends GetxController {
  RxBool isSearch = false.obs;
  TextEditingController textEditingController = TextEditingController();
  RxList<MovieModel> lstPopular = <MovieModel>[].obs;
  RxList<MovieModel> lstSearchMovie = <MovieModel>[].obs;

  @override
  void onInit() async {
    super.onInit();
    await getListPopularMovie();
  }

  @override
  void dispose() {
    textEditingController.clear();
    super.dispose();
  }

  ontapMovie(int id) async {
    Get.toNamed(Routes.detailpage, arguments: id);
  }

  getListPopularMovie() async {
    await ApiProvider().getPopularMovie().then((respone) {
      for (var item in respone["results"]) {
        lstPopular.add(MovieModel.fromJson(item));
      }
    });
  }

  RxBool isLoading = false.obs;

  onChanged(String value) async {
    if (value.length > 0 || value.isNotEmpty) {
      isSearch.value = true;
      isLoading.value = true;
    } else {
      isSearch.value = false;
      lstSearchMovie.clear();
      isLoading.value = false;
    }
  }

  ontapClear() {
    textEditingController.clear();
    isSearch.value = false;
    lstSearchMovie.clear();
  }

  searchFunction(String query) async {
    isLoading.value = true;
    await ApiProvider().searchMovie(query).then((respone) {
      for (var item in respone["results"]) {
        lstSearchMovie.add(MovieModel.fromJson(item));
      }
    });
    isLoading.value = false;
  }
}
