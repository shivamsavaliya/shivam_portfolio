import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AboutController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController animationController;
  RxDouble animationValue = 0.0.obs;
  RxBool isOnTop = false.obs;

  @override
  void onInit() {
    super.onInit();
    animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    animationController.addListener(() {
      animationValue.value = animationController.value;
    });
  }

  void onTap() {
    isOnTop.value = !isOnTop.value;
    if (isOnTop.value) {
      animationController.forward();
    } else {
      animationController.reverse();
    }
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }
}
