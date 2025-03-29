import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shivam_portfolio/controllers/intro_controller.dart';
import 'package:shivam_portfolio/utils/app_colors.dart';
import 'package:shivam_portfolio/widgets/custom_button.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import '../utils/responsive_layout.dart';

class IntroWidget extends StatelessWidget {
  final GlobalKey? scrollKey;
  IntroWidget({super.key, this.scrollKey});
  final IntroController controller =
      Get.put(IntroController(), permanent: false);

  @override
  Widget build(BuildContext context) {
    controller.fetchProfile();
    return SizedBox(
      key: scrollKey,
      height: ResponsiveLayout.getScreenHeight(context),
      width: ResponsiveLayout.getScreenWidth(context),
      child: ResponsiveLayout.isMobile(context)
          ? Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(300),
                  child: CachedNetworkImage(
                    imageUrl: controller.profilePic,
                    width: 300,
                    height: 300,
                  ),
                ),
                _buildContent(context),
              ],
            )
          : Stack(
              children: [
                _buildOuterCircle(context),
                _buildInnerCircle(),
                _buildProfileImage(),
                _buildContent(context),
              ],
            ),
    );
  }

  Widget _buildOuterCircle(BuildContext context) {
    final circleSize = ResponsiveLayout.responsiveValue(
      context: context,
      desktop: 400,
      tablet: 0,
      mobile: 0,
    );

    BoxDecoration borderDecoration = BoxDecoration(
      shape: BoxShape.circle,
      border: Border.all(width: 1, color: Colors.white),
    );

    return Positioned(
      right: ResponsiveLayout.isMobile(context) ? 0 : 20,
      top: ResponsiveLayout.responsiveValue(
        context: context,
        desktop: 100,
        mobile: 0,
      ),
      child: GetBuilder<IntroController>(
        id: 'outer_circle',
        builder: (controller) => AnimatedBuilder(
          animation: controller.rotationController,
          child: Container(
            width: 400,
            height: 400,
            decoration: borderDecoration,
          ),
          builder: (context, child) {
            return Transform.scale(
              scale: controller.scaleAnimation.value,
              child: Transform.rotate(
                angle: controller.rotationAnimation.value,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: circleSize,
                  height: circleSize,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.transparent),
                  ),
                  child: ShaderMask(
                    shaderCallback: (Rect bounds) {
                      return SweepGradient(colors: AppColors.colorizeColors)
                          .createShader(bounds);
                    },
                    child: child,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildInnerCircle() {
    const innerCircleSize = 120.0;

    final boxDecoration = BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: AppColors.cyan,
          blurRadius: 50,
          spreadRadius: 1,
        )
      ],
      shape: BoxShape.circle,
      border: Border.all(color: Colors.transparent),
      gradient: LinearGradient(colors: AppColors.colorizeColors),
    );

    return Positioned(
      right: 10,
      top: 100,
      child: GetBuilder<IntroController>(
        id: 'inner_circle',
        builder: (controller) => AnimatedBuilder(
          animation: controller.rotationController,
          child: Container(
            width: innerCircleSize,
            height: innerCircleSize,
            decoration: boxDecoration,
          ),
          builder: (context, child) {
            return Transform.scale(
              scale: controller.scaleAnimation.value,
              child: Transform.rotate(
                angle: controller.rotationAnimation.value,
                child: child,
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildProfileImage() {
    return Positioned(
      top: 90,
      right: 50,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(300),
        child: CachedNetworkImage(
          imageUrl: controller.profilePic,
          width: 300,
          height: 300,
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return SizedBox(
      width: ResponsiveLayout.responsiveValue(
        context: context,
        desktop: 700,
        mobile: 300,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GradientText(
            "Hello, I'm Shivam",
            colors: [
              AppColors.purple,
              AppColors.cyan,
            ],
            style: TextStyle(
              fontSize: ResponsiveLayout.responsiveValue(
                context: context,
                desktop: 50,
                mobile: 30,
              ),
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            "Flutter Developer",
            softWrap: true,
            style: TextStyle(
              fontSize: ResponsiveLayout.responsiveValue(
                context: context,
                desktop: 50,
                mobile: 30,
              ),
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 20),
          Text(
            "Flutter Developer passionate about building beautiful apps for Android, iOS and Web",
            softWrap: true,
            style: TextStyle(
              fontSize: ResponsiveLayout.responsiveValue(
                context: context,
                desktop: 30,
                mobile: 20,
              ),
              color: Colors.white,
            ),
          ),
          SizedBox(height: 20),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "I enjoy building great apps using Flutter. I'm really good at managing how things work and making designs that fit any screen. I've finished lots of projects that show how creative and helpful I can be",
              softWrap: true,
              style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.5),
                  fontSize: ResponsiveLayout.responsiveValue(
                    context: context,
                    desktop: 14,
                    mobile: 8,
                  )),
            ),
          ),
          SizedBox(height: 30),
          CustomButton(
            onTap: controller.downloadResume,
            title: 'Resume',
          ),
        ],
      ),
    );
  }
}
