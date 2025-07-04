import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'responsive_layout.dart';

class TextScaling {
  // Base font sizes for different text types
  static const double _baseHeading1 = 50.0;
  static const double _baseHeading2 = 40.0;
  static const double _baseHeading3 = 32.0;
  static const double _baseBody = 24.0;
  static const double _baseSmall = 20.0;
  static const double _baseTiny = 16.0;

  // Scaling factors for different screen sizes
  static const double _mobileScale = 1.4;
  static const double _tabletScale = 1.2;
  static const double _desktopScale = 0.7;

  static double getScaledFontSize(BuildContext context, double baseSize) {
    if (ResponsiveLayout.isMobile(context)) {
      return (baseSize * _mobileScale).sp;
    } else if (ResponsiveLayout.isTablet(context)) {
      return (baseSize * _tabletScale).sp;
    } else {
      return (baseSize * _desktopScale).sp;
    }
  }

  // Predefined text styles for different text types
  static TextStyle heading1(BuildContext context, {Color? color}) {
    return TextStyle(
      fontSize: getScaledFontSize(context, _baseHeading1),
      fontWeight: FontWeight.bold,
      color: color ?? Colors.white,
    );
  }

  static TextStyle heading2(BuildContext context, {Color? color}) {
    return TextStyle(
      fontSize: getScaledFontSize(context, _baseHeading2),
      fontWeight: FontWeight.w600,
      color: color ?? Colors.white,
    );
  }

  static TextStyle heading3(BuildContext context, {Color? color}) {
    return TextStyle(
      fontSize: getScaledFontSize(context, _baseHeading3),
      fontWeight: FontWeight.w500,
      color: color ?? Colors.white,
    );
  }

  static TextStyle body(BuildContext context, {Color? color}) {
    return TextStyle(
      fontSize: getScaledFontSize(context, _baseBody),
      color: color ?? Colors.white,
      height: 1.5,
    );
  }

  static TextStyle small(BuildContext context, {Color? color}) {
    return TextStyle(
      fontSize: getScaledFontSize(context, _baseSmall),
      color: color ?? Colors.white70,
      height: 1.4,
    );
  }

  static TextStyle tiny(BuildContext context, {Color? color}) {
    return TextStyle(
      fontSize: getScaledFontSize(context, _baseTiny),
      color: color ?? Colors.white60,
      height: 1.3,
    );
  }
}
