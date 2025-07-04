import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shivam_portfolio/controllers/tech_controller.dart';
import 'package:shivam_portfolio/utils/responsive_layout.dart';
import 'package:shivam_portfolio/utils/text_scaling.dart';

class TechWidget extends StatelessWidget {
  final GlobalKey? scrollKey;
  TechWidget({super.key, this.scrollKey});

  final TechController controller = TechController();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: controller.fetchSvgImages(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container();
        }
        if (snapshot.hasError) {
          return Center(
            child: Text(
              'Error: ${snapshot.error}',
              style: TextScaling.small(context),
            ),
          );
        }
        return Container(
          key: scrollKey,
          padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
          margin: EdgeInsets.symmetric(
            vertical: ResponsiveLayout.isMobile(context) ? 40.h : 100.h,
            horizontal: ResponsiveLayout.isMobile(context) ? 40.w : 180.w,
          ),
          alignment: Alignment.center,
          child: Column(
            children: [
              Text(
                'The tools and technology that I use',
                style: TextScaling.heading2(context),
              ),
              SizedBox(height: 50.h),
              Wrap(
                spacing: ResponsiveLayout.isMobile(context) ? 40.w : 80.w,
                runSpacing: ResponsiveLayout.isMobile(context) ? 40.h : 50.h,
                runAlignment: WrapAlignment.center,
                alignment: WrapAlignment.center,
                children: [
                  ...snapshot.data!.asMap().entries.map((entry) {
                    final svg = entry.value;
                    return Tooltip(
                      message: svg.name,
                      child: SvgPicture.memory(
                        svg.svgImage,
                        height:
                            ResponsiveLayout.isMobile(context) ? 30.h : 80.h,
                        width: ResponsiveLayout.isMobile(context) ? 30.w : 80.w,
                      ),
                    );
                  }),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
