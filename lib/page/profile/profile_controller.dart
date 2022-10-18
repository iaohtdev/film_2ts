import 'package:get/get.dart';
import 'package:movie_info/models/user.dart';

import '../../routers/app_pages.dart';
class ProfileController extends GetxController{


  UserModel user = UserModel(uid: '0xFF19191B', photoUrl: '', name: 'Mohamah Sela', email:'Sela@gmail.com', phone: "0987654321");

  @override
  void onInit(){
    super.onInit();

  }
  goToEdit(){
    Get.toNamed(Routes.editprofile, arguments: [user.toJson()]);
  }
}