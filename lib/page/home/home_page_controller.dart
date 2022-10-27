import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:movie_info/models/movie.dart';
import 'package:movie_info/models/tv.dart';
import 'package:movie_info/models/user.dart';
import 'package:movie_info/page/login/login_controller.dart';
import 'package:movie_info/page/navigation_bar/navigation_controller.dart';
import 'package:movie_info/provider/api_provider.dart';
import 'package:movie_info/routers/app_pages.dart';

class HomeController extends GetxController {
  Rx<UserModel> userModel = UserModel().obs;
  RxList<MovieModel> lstPopular = <MovieModel>[].obs;
  RxList<MovieModel> lstTopRate = <MovieModel>[].obs;
  RxList<MovieModel> lstNowPlaying = <MovieModel>[].obs;
  RxList<MovieModel> lstUpComing = <MovieModel>[].obs;
  RxList<TvSeriModel> lstTvOnTheAir = <TvSeriModel>[].obs;
  RxList<TvSeriModel> lstTvPopular = <TvSeriModel>[].obs;
  RxList<TvSeriModel> lstTvTopRate = <TvSeriModel>[].obs;
  Rx<MovieModel> movieModel = MovieModel().obs;

  final loginController = Get.put(LoginController());
  final naviController = Get.put(NavigationBarController());
  @override
  void onInit() async {
    super.onInit();
    await fechData();
  }

  Future<String> fechData() async {
    await getDocId();
    await getListPopularMovie();
    await getListTopRateMovie();
    await getListUpComing();
    await getListNowPlaying();
    await getListTvPopular();

    await getListTvTopRate();
    return Future.value("Data download successfully");
  }

  Future getDocId() async {
    await FirebaseFirestore.instance
        .collection("users")
        .where("uid", isEqualTo: loginController.userModel.value.uid)
        .get()
        .then((snapshot) {
      snapshot.docs.forEach((document) {
        userModel.value = UserModel.fromJson(document.data());
      });
    });
  }

  getListPopularMovie() async {
    await ApiProvider().getPopularMovie().then((respone) {
      for (var item in respone["results"]) {
        lstPopular.add(MovieModel.fromJson(item));
      }
    });
  }

  getListTopRateMovie() async {
    await ApiProvider().getTopRate().then((respone) {
      for (var item in respone["results"]) {
        lstTopRate.add(MovieModel.fromJson(item));
      }
    });
  }

  getListNowPlaying() async {
    await ApiProvider().getNowPlaying().then((respone) {
      for (var item in respone["results"]) {
        lstNowPlaying.add(MovieModel.fromJson(item));
      }
    });
  }

  getListUpComing() async {
    await ApiProvider().getUpComing().then((respone) {
      for (var item in respone["results"]) {
        lstUpComing.add(MovieModel.fromJson(item));
      }
    });
  }

  getListTvOnTheAir() async {
    await ApiProvider().getTvOnTheAir().then((respone) {
      for (var item in respone["results"]) {
        lstTvOnTheAir.add(TvSeriModel.fromJson(item));
      }
    });
  }

  getListTvPopular() async {
    await ApiProvider().getTvPopular().then((respone) {
      for (var item in respone["results"]) {
        lstTvPopular.add(TvSeriModel.fromJson(item));
      }
    });
  }

  getListTvTopRate() async {
    await ApiProvider().getTvTopRate().then((respone) {
      for (var item in respone["results"]) {
        lstTvTopRate.add(TvSeriModel.fromJson(item));
      }
    });
  }

  ontapMovie(int id) async {
    Get.toNamed(Routes.detailpage, arguments: id);
  }
}
