import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:movie_info/routers/app_pages.dart';

class FavoriteController extends GetxController {
  @override
  onInit() {

    super.onInit();
  }
  ontapMovie(int id) async {
    Get.toNamed(Routes.detailpage, arguments: id);
  }


}
