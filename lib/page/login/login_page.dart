import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_info/constants.dart';
import 'package:movie_info/page/login/components/cancel_button.dart';
import 'package:movie_info/page/login/components/login_form.dart';
import 'package:movie_info/page/login/components/register_form.dart';
import 'package:movie_info/page/login/login_controller.dart';
import 'package:movie_info/widget/background_gradient.dart';
import 'package:movie_info/widget/gradient_text.dart';

class LoginPage extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    double viewInset = MediaQuery.of(context).viewInsets.bottom;
    double defaultLoginSize = size.height - (size.height * 0.2);
    double defaultRegisterSize = size.height - (size.height * 0.1);

    controller.containerSize =
        Tween<double>(begin: size.height * 0.1, end: defaultRegisterSize)
            .animate(CurvedAnimation(
                parent: controller.animationController!, curve: Curves.linear));

    return Scaffold(
      backgroundColor: kBlack,
      body: Stack(
        children: [
          const BackGroundGradient(),
      
          Container(
            height: Get.height,
            width: Get.width,
            decoration: BoxDecoration(
                image: DecorationImage(
                    colorFilter: ColorFilter.mode(
                        kBlack.withOpacity(0.1), BlendMode.dstATop),
                    image:
                        const AssetImage("assets/images/background_login2.jpg"),
                    fit: BoxFit.cover)),
          ),
      
          Obx(() => LoginForm(
            emailController: controller.emailController,
            passwordController: controller.passwordController,
              isLogin: controller.isLogin.value,
              animationDuration: controller.animationDuration,
              size: size,
              defaultLoginSize: defaultLoginSize)),
      
          // Register Container
          AnimatedBuilder(
            animation: controller.animationController!,
            builder: (context, child) {


              
              if (viewInset == 0 && controller.isLogin.value) {
                return buildRegisterContainer();
              } else if (!controller.isLogin.value) {
                return buildRegisterContainer();
              }
      
              return Container();
            },
          ),
          Obx(() => CancelButton(
                isLogin: controller.isLogin.value,
                animationDuration: controller.animationDuration,
                size: size,
                animationController: controller.animationController,
                tapEvent: controller.isLogin.value
                    ? null
                    : () {
                        controller.tabButtonCancel();
                      },
              )),
      
          Obx(() => RegisterForm(
           
              isLogin: controller.isLogin.value,
              animationDuration: controller.animationDuration,
              size: size,
              defaultLoginSize: defaultRegisterSize)),
        ],
      ),
    );
  }

  Widget buildRegisterContainer() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Obx(() => Container(
            width: double.infinity,
            height: controller.containerSize.value,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
                color: controller.isLogin.value
                    ? kBlack.withOpacity(0.1)
                    : kBlack),
            alignment: Alignment.center,
            child: GestureDetector(
              onTap: !controller.isLogin.value
                  ? null
                  : () {
                      controller.tabRegister();
                    },
              child: controller.isLogin.value
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Chưa có tài khoản? ",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        GradientText(
                          'Đăng ký',
                          style: TextStyle(
                              fontSize: 16,
                              decoration: TextDecoration.underline,
                              fontStyle: FontStyle.italic),
                          gradient:
                              LinearGradient(colors: [kPink, kLightGreen]),
                        ),
                      ],
                    )
                  : null,
            ),
          )),
    );
  }
}
