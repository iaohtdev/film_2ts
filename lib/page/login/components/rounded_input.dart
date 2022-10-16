import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_info/page/login/login_controller.dart';


class ItemTextField extends GetView<LoginController> {
  final String? hintText;
  final TextEditingController? controllers;
  final Widget? suffixIcon;
  final bool? obscureText;
  final Function(String)? onChanged;
  final Function(String)? submit;
  final Widget preffixIcon;
  final Color colorBackground;
  final String? Function(String?)? validator;
  const ItemTextField(
      {Key? key,
      required this.hintText,
      required this.controllers,
      required this.suffixIcon,
      this.obscureText = false,
      this.onChanged,
      this.validator,
      this.submit,
      required this.colorBackground,
      required this.preffixIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              style: const TextStyle(color: Colors.white),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: validator,
            
              onChanged: onChanged,
              controller: controllers,
              obscureText: obscureText!,
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(30.0),
                ),
                filled: true,
                fillColor: colorBackground,
                hintText: hintText,
                hintStyle: const TextStyle(color: Colors.white),
                prefixIcon: Padding(
                    padding: const EdgeInsets.only(right: 10, left: 20),
                    child: preffixIcon),
                prefixIconConstraints:
                    BoxConstraints(minHeight: 55, minWidth: 55),
                suffixIcon: suffixIcon,
              ),
              onFieldSubmitted: submit,
            ),
         
          SizedBox(height: 15,)
          ],
        ),
      ],
    );
  }
}
