import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shivam_portfolio/controllers/about_controller.dart';
import 'package:shivam_portfolio/utils/app_colors.dart';
import 'package:shivam_portfolio/utils/app_constants.dart';
import 'package:shivam_portfolio/utils/text_scaling.dart';
import 'package:shivam_portfolio/utils/responsive_layout.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutWidget extends StatelessWidget {
  final GlobalKey? scrollKey;
  AboutWidget({super.key, this.scrollKey});

  final AboutController aboutController = Get.put(AboutController());

  @override
  Widget build(BuildContext context) {
    return Container(
      key: scrollKey,
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: 50.h,
      ),
      color: Colors.transparent,
      child: Column(
        children: [
          _buildInfoSection(context),
          SizedBox(height: 40.h),
          _buildSocialButtons(context),
        ],
      ),
    );
  }

  Widget _buildInfoSection(BuildContext context) {
    return ResponsiveLayout.isDesktop(context)
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              envelopeSection(context),
              SizedBox(width: 50.w),
              infoSection(context),
            ],
          )
        : infoSection(context);
  }

  Widget infoSection(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: ResponsiveLayout.isDesktop(context) ? 550.w : double.infinity,
      ),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Welcome to My Tech Adventure!',
              style: TextScaling.heading2(context),
            ),
          ),
          SizedBox(height: 20.h),
          SelectableText(
            AppConstants.aboutMe,
            style: TextScaling.body(context, color: Colors.white70),
          ),
        ],
      ),
    );
  }

  SizedBox envelopeSection(BuildContext context) {
    return SizedBox(
      width: 300.w,
      height: 500.h,
      child: Stack(
        children: [
          Positioned(
            top: 50.h,
            child: ClipPath(
              clipper: ArrowClipper(100, 400, Edge.TOP),
              child: Container(
                color: Colors.red[300],
                height: 200.h,
                width: 300.w,
              ),
            ),
          ),
          Obx(() => Positioned(
                top: (150.h + (aboutController.animationValue.value * -100.h)),
                left: 25.w,
                child: GestureDetector(
                  onTap: aboutController.onTap,
                  child: Container(
                    width: 250.w,
                    height: 200.h,
                    padding: EdgeInsets.all(10.r),
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Click Me",
                          softWrap: true,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize:
                                TextScaling.getScaledFontSize(context, 28),
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          "I turn ideas into pocket-sized experiences crafting apps that not only work smoothly but feel good to use. Whether it's real-time updates or creative features, I love bringing a little magic to the screen.",
                          style: TextStyle(
                            fontSize: 10,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                  ),
                ),
              )),
          Positioned(
            bottom: 80.h,
            child: Container(
              color: Colors.red[300],
              height: 180.h,
              width: 300.w,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: ResponsiveLayout.isDesktop(context)
          ? 24.w
          : ResponsiveLayout.isTablet(context)
              ? 30.w
              : 42.w,
      children: [
        _buildSocialButton(
            context, FontAwesomeIcons.github, AppConstants.githubUrl),
        _buildSocialButton(
            context, FontAwesomeIcons.linkedinIn, AppConstants.linkedinUrl),
        _buildSocialButton(
            context, FontAwesomeIcons.envelope, AppConstants.emailUrl),
      ],
    );
  }

  Widget _buildSocialButton(BuildContext context, IconData icon, String url) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => launchUrl(Uri.parse(url)),
        child: Container(
          padding: EdgeInsets.all(12.r),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.05),
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(
              color: AppColors.purple.withValues(alpha: 0.3),
              width: 1.w,
            ),
          ),
          child: FaIcon(
            icon,
            color: Colors.white,
            size: ResponsiveLayout.isDesktop(context)
                ? 30.r
                : ResponsiveLayout.isTablet(context)
                    ? 40.r
                    : 50.r,
          ),
        ),
      ),
    );
  }
}
