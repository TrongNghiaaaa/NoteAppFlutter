import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RootController extends GetxController {
  final pageController = PageController();
  final currentIndex = 0.obs;

  void changePage(int index) {
    currentIndex.value = index;
    pageController.jumpToPage(index);
  }
}
