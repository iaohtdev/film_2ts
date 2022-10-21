import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:movie_info/models/user.dart';

import '../../routers/app_pages.dart';

class ProfileController extends GetxController {

  Rx<UserModel> userModel = UserModel().obs;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  late PageController pageController = PageController();
  final formKey = GlobalKey<FormState>();
  DateTime selectedDate = DateTime.now();
  
  @override
  void onInit()async {
    super.onInit();
    userModel.value  =Get.arguments;
await  getDataUser();
  }

getDataUser(){

  nameController.text = userModel.value.name!;
  emailController.text = userModel.value.email!;

}

  void onAddButtonTapped(int index) {
    pageController.animateToPage(index,
        duration: Duration(milliseconds: 500), curve: Curves.elasticInOut);

  }

  goToEdit() {
    Get.toNamed(
      Routes.editprofile,
    );
  }
   validName(String? name) {
    if (name == null || name == "") {
      return "Tên không được để trống";
    }
  }
}
