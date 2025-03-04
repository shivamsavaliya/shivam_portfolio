import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math';

class IntroController extends GetxController
    with GetSingleTickerProviderStateMixin {
  var hoverAnimate = false.obs;
  late AnimationController rotationController;
  late Animation<double> rotationAnimation;
  late Animation<double> scaleAnimation;

  @override
  void onInit() {
    super.onInit();
    rotationController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    rotationAnimation = Tween<double>(
      begin: 0,
      end: 2 * pi,
    ).animate(rotationController);

    scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.1,
    ).animate(
      CurvedAnimation(
        parent: rotationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  void startAnimations() {
    rotationController.repeat(reverse: true);
  }

  void stopAnimations() {
    rotationController.stop();
    rotationController.reset();
  }

  @override
  void dispose() {
    rotationController.dispose();
    super.dispose();
  }
}
