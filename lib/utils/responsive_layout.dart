import 'package:flutter/material.dart';

class ResponsiveLayout {
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 600;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 600 &&
      MediaQuery.of(context).size.width < 1200;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1200;

  static double getScreenWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;

  static double getScreenHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  static double responsiveValue({
    required BuildContext context,
    required double desktop,
    double? tablet,
    double? mobile,
    double? smallMobile,
  }) {
    final width = getScreenWidth(context);
    if (width < 380 && smallMobile != null) {
      return smallMobile;
    } else if (isDesktop(context)) {
      return desktop;
    } else if (isTablet(context)) {
      return tablet ?? desktop * 0.75;
    }
    return mobile ?? desktop * 0.5;
  }

  static EdgeInsets responsivePadding(BuildContext context) {
    final width = getScreenWidth(context);
    if (width < 380) {
      return const EdgeInsets.symmetric(horizontal: 12, vertical: 16);
    } else if (isDesktop(context)) {
      return const EdgeInsets.symmetric(horizontal: 160, vertical: 50);
    } else if (isTablet(context)) {
      return const EdgeInsets.symmetric(horizontal: 80, vertical: 30);
    }
    return const EdgeInsets.symmetric(horizontal: 20, vertical: 20);
  }

  static double responsiveSpacing(BuildContext context) {
    if (isDesktop(context)) {
      return 30;
    } else if (isTablet(context)) {
      return 20;
    }
    return 14;
  }

  static Widget buildResponsive({
    required BuildContext context,
    required Widget mobile,
    Widget? tablet,
    required Widget desktop,
  }) {
    if (isDesktop(context)) {
      return desktop;
    } else if (isTablet(context)) {
      return tablet ?? mobile;
    }
    return mobile;
  }
}
