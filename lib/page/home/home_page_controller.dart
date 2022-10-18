import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:movie_info/models/movie.dart';
import 'package:movie_info/models/user.dart';
import 'package:movie_info/page/login/login_controller.dart';
import 'package:movie_info/page/navigation_bar/navigation_controller.dart';
import 'package:movie_info/provider/api_provider.dart';
import 'package:movie_info/routers/app_pages.dart';

class HomeController extends GetxController {
  Rx<UserModel> userModel = UserModel().obs;
  RxList<MovieModel> lstPopular = <MovieModel>[].obs;
  Rx<MovieModel> movieModel = MovieModel().obs;

  final loginController = Get.put(LoginController());
  final naviController = Get.put(NavigationBarController());
  @override
  void onInit() {
    super.onInit();
   
  }

   Future<String> fechData() async {
    await getDocId();
    await getListPopularMovie();
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

  ontapMovie(int id) async {
    Get.toNamed(Routes.detailpage, arguments: id);
  }
}
