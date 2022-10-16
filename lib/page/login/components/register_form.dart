import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:movie_info/page/login/components/rounded_button.dart';
import 'package:movie_info/page/login/components/rounded_input.dart';
import 'package:movie_info/page/login/login_controller.dart';

class RegisterForm extends GetView<LoginController> {
  RegisterForm({
    Key? key,
    required this.isLogin,
    required this.animationDuration,
    required this.size,
    required this.defaultLoginSize,
  }) : super(key: key);

  final bool isLogin;
  final Duration animationDuration;
  final Size size;
  final double defaultLoginSize;
  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: isLogin ? 0.0 : 1.0,
      duration: animationDuration * 5,
      child: Visibility(
        visible: !isLogin,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            width: size.width,
            height: defaultLoginSize,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Form(
                  key: controller.formKeyRegister,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 50),
                      const Text(
                        'Đăng ký ngay',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 24),
                      ),
                      const SizedBox(height: 30),
                      const Text(
                        'Để không bỏ lỡ những bộ phim mà bạn yêu thích',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.white),
                      ),
                      SizedBox(height: Get.height * 0.1),
                      ItemTextField(
                          preffixIcon: SvgPicture.asset(
                            "assets/icons/icon-profile_outline.svg",
                            height: 10,
                            color: Colors.white,
                          ),
                          colorBackground: Colors.grey.withOpacity(0.2),
                          suffixIcon: const SizedBox(),
                          hintText: "Email hoặc số điện thoại",
                          controllers: controller.emailController,
                          validator: (email) => controller.validEmail(email)),
                      ItemTextField(
                          preffixIcon: const Icon(
                            Icons.face,
                            color: Colors.white,
                          ),
                          colorBackground: Colors.grey.withOpacity(0.2),
                          suffixIcon: const SizedBox(),
                          hintText: "Tên hiển thị",
                          controllers: controller.nameController,
                          validator: (name) => controller.validName(name)),
                      Obx(() => ItemTextField(
                          obscureText: !controller.isHintPass.value,
                          preffixIcon: Icon(
                            Icons.lock_outline,
                            color: Colors.white,
                          ),
                          colorBackground: Colors.grey.withOpacity(0.2),
                          suffixIcon: IconButton(
                              onPressed: () {
                                controller.tabHintPass();
                              },
                              icon: controller.isHintPass.value
                                  ? const Icon(
                                      Icons.visibility_off_outlined,
                                      color: Colors.white,
                                    )
                                  : const Icon(
                                      Icons.visibility_outlined,
                                      color: Colors.white,
                                    )),
                          hintText: "Mật khẩu",
                          controllers: controller.passwordController,
                          validator: (pass) => controller.validPass(pass))),
                      const SizedBox(height: 30),
                      RoundedButton(title: 'Đăng ký', ontap: () {
                        controller.onRegister();


                      }),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
