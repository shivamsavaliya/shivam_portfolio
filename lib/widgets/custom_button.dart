import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../utils/responsive_layout.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onTap,
    required this.title,
  });

  final void Function()? onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ResponsiveLayout.responsiveValue(
          context: context, desktop: 50, mobile: 30),
      width: ResponsiveLayout.responsiveValue(
          context: context, desktop: 180, mobile: 100),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: AppColors.purple,
          boxShadow: [
            BoxShadow(
              color: AppColors.cyan,
              spreadRadius: 0.2,
              offset: Offset(4, 4),
            ),
          ]),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(40),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(40),
            child: Ink(
              child: Center(
                child: Text(
                  title,
                  softWrap: true,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: ResponsiveLayout.responsiveValue(
                      context: context,
                      desktop: 16,
                      mobile: 10,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
