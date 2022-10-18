import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../models/user.dart';
class EditProfileController extends GetxController{
  TextEditingController nameController = TextEditingController();
  TextEditingController mailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  FocusNode nameFocus = FocusNode();
  FocusNode mailFocus = FocusNode();
  FocusNode phoneFocus = FocusNode();
  final arguments = Get.arguments[0];
  late UserModel user;
  @override
  void onInit(){
    super.onInit();
    user = UserModel.fromJson(arguments);
    nameController.text = user.name!;
    phoneController.text = user.phone!;
    mailController.text = user.email!;
  }
}