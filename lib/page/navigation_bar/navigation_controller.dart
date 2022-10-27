import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class NavigationBarController extends GetxController {
  RxInt selectedIndex = 0.obs;
  final scrollController = ScrollController();
 
  @override
  onInit() {
   
    super.onInit();
  }

  ontapNavi(int index) {
    selectedIndex.value = index;

  }

}
