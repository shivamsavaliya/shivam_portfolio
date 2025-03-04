import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final infoWidget = GlobalKey().obs;
  final introWidget = GlobalKey().obs;

  void scrollToInfo(GlobalKey key) {
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }
}
