import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/app_colors.dart';
import '../utils/responsive_layout.dart';
import '../utils/text_scaling.dart';

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
      height: 50.h,
      width: 180.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.r),
          color: AppColors.purple,
          boxShadow: [
            BoxShadow(
              color: AppColors.cyan,
              spreadRadius: 0.2,
              offset: Offset(4.w, 4.h),
            ),
          ]),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(40.r),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(40.r),
            child: Ink(
              child: Center(
                child: Text(
                  title,
                  softWrap: true,
                  style: TextScaling.body(context),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
