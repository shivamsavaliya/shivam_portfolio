import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../utils/app_constants.dart';

class IntroController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController rotationController;
  late Animation<double> rotationAnimation;
  late Animation<double> scaleAnimation;

  @override
  void onInit() {
    super.onInit();
    _initializeAnimations();
    startAnimations();
  }

  void _initializeAnimations() {
    rotationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    rotationAnimation = Tween<double>(
      begin: 0,
      end: 2 * 3.14159,
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

  @override
  void onClose() {
    rotationController.dispose();
    super.onClose();
  }

  void downloadResume() async {
    final String fileName = "ShivamResume.pdf";
    final String fileUrl =
        AppConstants.supabase.storage.from("resume").getPublicUrl(fileName);

    if (await canLaunchUrl(Uri.parse(fileUrl))) {
      await launchUrl(Uri.parse(fileUrl), mode: LaunchMode.externalApplication);
    } else {
      log("Could not launch URL");
    }
  }
}
