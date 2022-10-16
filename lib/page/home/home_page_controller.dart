import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:movie_info/models/user.dart';
import 'package:movie_info/page/login/login_controller.dart';
import 'package:movie_info/page/navigation_bar/navigation_controller.dart';

class HomeController extends GetxController {
  Rx<UserModel> userModel = UserModel().obs;

  final loginController = Get.put(LoginController());
  final naviController = Get.put(NavigationBarController());
  @override
  void onInit() {
    super.onInit();
    getDocId();
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
}
