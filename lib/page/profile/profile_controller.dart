import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
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
  Rx<DateTime> selectedDate = DateTime.now().obs;
  File? image;
  File? urlPhoto;
  @override
  void onInit() async {
    super.onInit();
    userModel.value = Get.arguments;
    await getDataUser();


    
  }

  getDataUser() {
    nameController.text = userModel.value.name!;
    emailController.text = userModel.value.email!;
    phoneController.text = userModel.value.phone!;
    dateController.text = userModel.value.date!;
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

  onDateTimeChanged(DateTime date) {
    selectedDate.value = date;
    dateController.text = DateFormat("dd/MM/yyyy").format(selectedDate.value);
  }

  updateUser() async {
    await FirebaseFirestore.instance
        .collection("users")
        .where("uid", isEqualTo: userModel.value.uid)
        .get()
        .then((value) async {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(value.docs[0].id)
          .update({
        "name": nameController.text,
        "phone": phoneController.text,
        "datetime": dateController.text,
        "photoUrl": urlPhoto.toString()
      });
    });

    Get.offAllNamed(Routes.navigationbar);
  }

  Future getImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (image == null) return;
    final imageTemporary = File(image.path);

    urlPhoto = imageTemporary;
    this.image = imageTemporary;

    update();
  }



  ///changelanguage 
  ///
  ///
  RxBool isChoose =false.obs;
  RxInt indexSelected =0.obs;
  changeLanguage(int index){


    isChoose.value = true;
    indexSelected.value =index;
  }



final lstLanguage =[
  "Tiếng Việt",
  "Tiếng Anh",
];

}
