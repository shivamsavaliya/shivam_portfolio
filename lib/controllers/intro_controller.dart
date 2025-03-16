import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math' as math;
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../utils/app_constants.dart';

class IntroController extends GetxController
    with GetSingleTickerProviderStateMixin {
  RxBool hoverAnimate = false.obs;
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
      end: 2 * math.pi,
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
