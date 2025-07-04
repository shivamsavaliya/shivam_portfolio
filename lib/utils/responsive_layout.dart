import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:html' as html;

class ResponsiveLayout {
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 768;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 768 &&
      MediaQuery.of(context).size.width < 1200;

  static bool isDesktop(BuildContext context) {
    // Check if the user agent indicates desktop mode
    final userAgent = html.window.navigator.userAgent.toLowerCase();
    final isDesktopMode = userAgent.contains('mobile') == false;

    // Return true if either the screen width is large enough OR we're in desktop mode
    return MediaQuery.of(context).size.width >= 1200 || isDesktopMode;
  }

  static double getScreenWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;

  static double getScreenHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  static double responsiveValue({
    required BuildContext context,
    required double desktop,
    double? tablet,
    double? mobile,
  }) {
    if (isDesktop(context)) {
      return desktop.w;
    } else if (isTablet(context)) {
      return (tablet ?? desktop * 0.8).w;
    }
    return (mobile ?? desktop * 0.6).w;
  }

  static EdgeInsets responsivePadding(BuildContext context) {
    if (isMobile(context)) {
      return EdgeInsets.symmetric(
        horizontal: getScreenWidth(context) < 380 ? 12.w : 20.w,
        vertical: 16.h,
      );
    } else if (isTablet(context)) {
      return EdgeInsets.symmetric(horizontal: 40.w, vertical: 30.h);
    }
    return EdgeInsets.symmetric(horizontal: 160.w, vertical: 50.h);
  }

  static Widget buildResponsive({
    required BuildContext context,
    required Widget mobile,
    Widget? tablet,
    required Widget desktop,
  }) {
    if (isDesktop(context)) {
      return desktop;
    } else if (isTablet(context) && tablet != null) {
      return tablet;
    }
    return mobile;
  }

  static double getContentWidth(BuildContext context) {
    if (isMobile(context)) {
      return 0.9.sw;
    } else if (isTablet(context)) {
      return 0.85.sw;
    }
    return 0.8.sw;
  }

  static double getMaxContentWidth(BuildContext context) {
    if (isMobile(context)) {
      return 850.w;
    } else if (isTablet(context)) {
      return 1000.w;
    }
    return 1200.w;
  }
}
