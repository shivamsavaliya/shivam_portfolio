import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shivam_portfolio/repo/data_repo.dart';
import 'package:shivam_portfolio/utils/app_colors.dart';
import '../utils/responsive_layout.dart';
import '../utils/text_scaling.dart';

class Header extends StatelessWidget {
  final VoidCallback? onHomeTap;
  final VoidCallback? onProjectTap;
  final VoidCallback? onAboutTap;

  const Header({super.key, this.onHomeTap, this.onProjectTap, this.onAboutTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 0.8.sw,
      height: 0.1.sh,
      margin: EdgeInsets.symmetric(
        vertical: 20.h,
        horizontal: 0.05.sw,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(6.r)),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 34.w, vertical: 4.h),
          color: AppColors.headerColor,
          child: Row(
            children: [
              SvgPicture.asset(
                'assets/images/name.svg',
                height: 45.h,
                width: 100.w,
                fit: BoxFit.cover,
              ),
              Spacer(),
              ...DataRepo.headerData
                  .asMap()
                  .map(
                    (key, value) => MapEntry(
                      key,
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 18.w),
                        child: MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () {
                              if (key == 0) {
                                onHomeTap!();
                              } else if (key == 1) {
                                onProjectTap!();
                              } else if (key == 2) {
                                onAboutTap!();
                              }
                            },
                            child: Text(
                              value.title,
                              style: TextScaling.small(context),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                  .values,
            ],
          ),
        ),
      ),
    );
  }
}
