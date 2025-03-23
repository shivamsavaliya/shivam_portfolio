import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/responsive_layout.dart';

class HomeController extends GetxController {
  final infoWidget = GlobalKey().obs;
  final introWidget = GlobalKey().obs;
  final techWidget = GlobalKey().obs;
  final aboutWidget = GlobalKey().obs;

  void scrollToInfo(GlobalKey key) {
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }

  bool isMobile() {
    return ResponsiveLayout.isMobile(Get.context!);
  }
}
