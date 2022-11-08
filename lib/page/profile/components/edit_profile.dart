
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:movie_info/constants.dart';
import 'package:movie_info/page/profile/profile_controller.dart';
import 'package:movie_info/widget/icon_back.dart';
import 'package:movie_info/widget/ouline_paint.dart';

class EditProfile extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onTap: () {
          unfocusKeyboard(context);
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  children: [
                    _header(),
                    SizedBox(height: 24),
                    _body(context),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _header() => SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: paddingHeader,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconBackWidget(),
                Text(
                  "Thông tin tài khoản",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  width: 35,
                )
              ],
            ),
            SizedBox(height: 30),
            GetBuilder<ProfileController>(
              init: ProfileController(),
              initState: (_) {},
              builder: (_) {
                return GestureDetector(
                  onTap: () {
                    controller.getImage();
                  },
                  child: Align(
                    alignment: Alignment.center,
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        CustomOutlineButton(
                          gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                kPink,
                                kPink.withOpacity(0.7),
                                kLightGreen.withOpacity(0.7),
                                kLightGreen
                              ],
                              stops: const [
                                0.2,
                                0.4,
                                0.6,
                                1
                              ]),
                          radius: Get.width * 0.8,
                          strokeWidth: 2.5,
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Container(
                              height: 150,
                              width: 150,
                              child: ClipRRect(
                                  borderRadius:
                                      BorderRadius.circular(Get.width * 0.8),
                                  child: controller.image == null
                                      ? Image.asset("assets/images/logo.png")
                                      : Image.file(controller.image!,fit: BoxFit.cover,)),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 60,
                          bottom: -10,
                          child: InkWell(
                            onTap: () {},
                            child: Container(
                              height: 35,
                              width: 35,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                  child: SvgPicture.asset(
                                "assets/icons/icon-camera.svg",
                                color: kBlack,
                              )),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 24),
          ],
        ),
      );

  Widget _body(BuildContext context) => Form(
        key: controller.formKey,
        child: Column(children: [
          _itemTextfield(
              title: 'Họ và tên',
              controller: controller.nameController,
              icon: "assets/icons/icon-profile_outline.svg",
              validator: (name) => controller.validName(name)),
          _itemTextfield(
            title: 'Email',
            controller: controller.emailController,
            icon: "assets/icons/icon-mail.svg",
            enabled: false,
          ),
          _itemTextfield(
            title: 'Số điện thoại',
            controller: controller.phoneController,
            icon: "assets/icons/icon-call.svg",
            isNumber: true,
          ),
          GestureDetector(
            onTap: () {
              _showDatePicker(context);
            },
            child: Column(
              children: [
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  enabled: false,
                  textAlignVertical: TextAlignVertical.center,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                  controller: controller.dateController,
                  cursorColor: Colors.grey,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    contentPadding: EdgeInsets.symmetric(vertical: 10),
                    label: Text("Ngày sinh"),
                    labelStyle: TextStyle(color: Colors.white),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    prefixIconConstraints:
                        const BoxConstraints(maxHeight: 50, maxWidth: 60),
                    prefixIcon: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: SvgPicture.asset(
                              "assets/icons/icon-calendar.svg",
                              color: Colors.white,
                              height: 24,
                              width: 24),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: Container(
                            width: 1,
                            height: Get.height,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  onFieldSubmitted: (submit) {},
                ),
                SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),
          InkWell(
            onTap: () {
              controller.updateUser();
            },
            child: Container(
                height: 40,
                width: Get.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.pink,
                ),
                child: Center(
                  child: Text('Cập nhật',
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.white)),
                )),
          ),
        ]),
      );

  _itemTextfield(
      {String? title,
      String? icon,
      bool? enabled = true,
      bool? isNumber = false,
      String? Function(String?)? validator,
      Function(String)? onChanged,
      Function(String)? submit,
      required TextEditingController? controller}) {
    return Column(
      children: [
        TextFormField(
          keyboardType: isNumber == true ? TextInputType.number : null,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          enabled: enabled,
          textAlignVertical: TextAlignVertical.center,
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: enabled == false ? Colors.grey : Colors.white),
          controller: controller,
          cursorColor: Colors.grey,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(color: Colors.white),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(color: Colors.grey),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(10.0),
            ),
            contentPadding: EdgeInsets.symmetric(vertical: 10),
            label: Text(title ?? "Lable"),
            labelStyle:
                TextStyle(color: enabled == false ? Colors.grey : Colors.white),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            prefixIconConstraints:
                const BoxConstraints(maxHeight: 50, maxWidth: 60),
            prefixIcon: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: SvgPicture.asset(icon!,
                      color: enabled == false ? Colors.grey : Colors.white,
                      height: 24,
                      width: 24),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Container(
                    width: 1,
                    height: Get.height,
                    color: enabled == false ? Colors.grey : Colors.white,
                  ),
                ),
              ],
            ),
          ),
          validator: validator,
          onChanged: onChanged,
          onFieldSubmitted: submit,
        ),
        SizedBox(
          height: 20,
        )
      ],
    );
  }

  _showDatePicker(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Wrap(
          children: [
            Container(
              height: 200,
              child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.date,
                  initialDateTime: controller.selectedDate.value,
                  onDateTimeChanged: (date) {
                    controller.onDateTimeChanged(date);
                  }),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 5,
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        decoration: BoxDecoration(
                            color: kBlack,
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                            child: Text(
                          "Hủy",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        )),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    flex: 5,
                    child: GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        decoration: BoxDecoration(
                            color: kBlack,
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                            child: Text(
                          "Chọn",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        )),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
