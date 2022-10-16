import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:movie_info/constants.dart';
import 'package:movie_info/page/login/login_controller.dart';
import 'package:movie_info/page/login/components/rounded_button.dart';
import 'package:movie_info/page/login/components/rounded_input.dart';
import 'package:movie_info/widget/gradient_text.dart';
import 'package:movie_info/widget/icon_back.dart';

class LoginForm extends GetView<LoginController> {
  LoginForm({
    Key? key,
    required this.isLogin,
    required this.animationDuration,
    required this.size,
    required this.defaultLoginSize,
    required this.emailController,
    required this.passwordController,
  }) : super(key: key);

  final bool isLogin;
  final Duration animationDuration;
  final Size size;
  final double defaultLoginSize;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: isLogin ? 1.0 : 0.0,
      duration: animationDuration * 4,
      child: SafeArea(
        child: SizedBox(
          width: size.width,
          height: defaultLoginSize,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Form(
                key: controller.formKeyLogin,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    const IconBackWidget(),
                    SizedBox(height: Get.height * 0.1),
                    const Text(
                      'Xin chào!',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 26,
                          color: Colors.white),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Đăng nhập ngay',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 26,
                          color: Colors.white),
                    ),
                    SizedBox(height: Get.height * 0.08),
                    ItemTextField(
                        preffixIcon: SvgPicture.asset(
                          "assets/icons/icon-profile_outline.svg",
                          height: 10,
                          color: Colors.white,
                        ),
                        colorBackground: kBlack.withOpacity(0.8),
                        suffixIcon: const SizedBox(),
                        hintText: "Email hoặc số điện thoại",
                        controllers: controller.emailController,
                        submit: (value) => controller.onLogin(),
                        validator: (email) =>controller. validEmail(email)
                       
                        ),
                    Obx(() => ItemTextField(
                          obscureText: !controller.isHintPass.value,
                          preffixIcon: Icon(
                            Icons.lock_outline,
                            color: Colors.white,
                          ),
                          colorBackground: kBlack.withOpacity(0.8),
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
                          submit: (value) => controller.onLogin(),
                          validator: (pass) =>controller.  validPass(pass)
                        )),
                    const SizedBox(height: 30),
                    RoundedButton(
                      title: 'Đăng nhập',
                      ontap: () {
                       controller.onLogin();
                      },
                    ),
                    const SizedBox(height: 20),
                    Center(
                      child: GradientText(
                        'Quên mật khẩu',
                        style: TextStyle(
                            fontSize: 16,
                            decoration: TextDecoration.underline,
                            fontStyle: FontStyle.italic),
                        gradient: LinearGradient(colors: [kPink, kLightGreen]),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }


}
