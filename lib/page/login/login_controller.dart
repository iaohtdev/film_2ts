
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_info/models/user.dart';
import 'package:movie_info/page/auth/login_firebase.dart';
import 'package:movie_info/routers/app_pages.dart';
import 'package:movie_info/widget/loading_animation.dart';

class LoginController extends GetxController
    with GetSingleTickerProviderStateMixin {
  RxBool isLogin = true.obs;
  RxBool isHintPass = false.obs;
  late Animation<double> containerSize;
  AnimationController? animationController;
  Duration animationDuration = const Duration(milliseconds: 270);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  String? textError;
  final formKeyLogin = GlobalKey<FormState>();
  final formKeyRegister = GlobalKey<FormState>();

  Rx<UserModel> userModel = UserModel().obs;
  //create value

  @override
  void onInit() {
    super.onInit();
    animationController =
        AnimationController(vsync: this, duration: animationDuration);

    emailController.text = "thoai@gmail.com";
    passwordController.text = "12345678";
    nameController.text = "";
  }

  @override
  void dispose() {
    super.dispose();
    animationController!.dispose();
    emailController.clear();
    passwordController.clear();
    nameController.clear();
  }

  tabButtonCancel() {
    animationController!.reverse();

    isLogin.value = !isLogin.value;
  }

  tabRegister() {
    animationController!.forward();

    isLogin.value = !isLogin.value;
  }

  tabHintPass() {
    isHintPass.value = !isHintPass.value;
  }

  onRegister() async {
    final isValid = formKeyLogin.currentState!.validate();
    if (textError == "email-already-in-use") {
      LoadingWidget.showLoading(Get.context!);
      await FirebaseFunction()
          .registerWithEmail(emailController.text, passwordController.text,
              nameController.text)
          .then((user) async {
        if (user != null) {
          //keep login

          Get.back();
          Get.toNamed(Routes.navigationbar);
        } else {
          Get.back();
        }
      });
    } else if (isValid) {
      LoadingWidget.showLoading(Get.context!);
      await FirebaseFunction()
          .registerWithEmail(emailController.text, passwordController.text,
              nameController.text)
          .then((user) async {
        if (user != null) {
          //keep login

          Get.back();
          Get.toNamed(Routes.navigationbar);
        } else {
          Get.back();
        }
      });
    }
  }

  RxString errorEmail = "".obs;
  RxString errorPass = "".obs;
  Color colorBorderEmail = Colors.transparent;
  Color colorBorderPass = Colors.transparent;
  onLogin() async {
    final isValid = formKeyLogin.currentState!.validate();
    if (textError == "user-not-found" || textError == "wrong-password") {
      LoadingWidget.showLoading(Get.context!);

      await FirebaseFunction()
          .loginWithEmail(emailController.text, passwordController.text)
          .then((user) async {
        if (user != null) {
          userModel.value.uid = user.uid;
          Get.back();
          Get.toNamed(Routes.navigationbar);
        } else {
          Get.back();
        }
      });
    } else if (isValid) {
      LoadingWidget.showLoading(Get.context!);

      await FirebaseFunction()
          .loginWithEmail(emailController.text, passwordController.text)
          .then((user) async {
        if (user != null) {
          userModel.value.uid = user.uid;

          Get.back();
          Get.toNamed(Routes.navigationbar);
        } else {
          Get.back();
        }
      });
    }
  }

  validEmail(String? email) {
    if (email == null || email == "") {
      return "Email hoặc số điện thọa không được để trống";
    } else {
      if (!EmailValidator.validate(email)) {
        return "Email sai định dạng";
      } else {
        if (textError == "user-not-found") {
          return "Không tìm thấy Email";
        } else if (textError == "email-already-in-use") {
          return "Email đã được sử dụng";
        }
      }
    }
  }

  validPass(String? pass) {
    if (pass == null || pass == "") {
      return "Mật khẩu không được để trống";
    } else {
      if (pass.length < 7) {
        return "Mật khẩu phải trên 7 kí tự";
      } else if (textError == "wrong-password") {
        return "Mật khẩu sai";
      }
    }
  }

  validName(String? name) {
    if (name == null || name == "") {
      return "Tên không được để trống";
    }
  }
}
