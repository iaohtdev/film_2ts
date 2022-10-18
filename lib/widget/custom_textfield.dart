import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? title;
  final double? height;
  final double? width;
  final FocusNode? focusNode;

  final Widget? prefixIcon;
  final bool? obscureText;

  const CustomTextField(
      {Key? key,
      required this.controller,
      required this.title,
      required this.focusNode,
      required this.prefixIcon,
      this.obscureText = false,
      this.height,
      this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 60,
      width: width ?? Get.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 1,
            color: focusNode!.hasFocus ? Colors.deepOrange : Colors.grey,
          )),
      child: Row(
        children: [
          Container(
              height: 30,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: prefixIcon,
              )),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Container(
              width: 1,
              height: Get.height,
              color: Colors.white,
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(
                  top: 5, bottom: 10, left: 10, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title ?? '',
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.white,
                      )),
                  Expanded(
                    child: TextFormField(
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                      controller: controller,
                      focusNode: focusNode,
                      obscureText: obscureText!,
                      cursorColor: Colors.blueGrey,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        suffixIconConstraints:
                            const BoxConstraints(maxHeight: 30, maxWidth: 40),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
