import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shivam_portfolio/controllers/intro_controller.dart';
import 'package:shivam_portfolio/utils/app_colors.dart';
import 'package:shivam_portfolio/utils/text_scaling.dart';
import 'package:shivam_portfolio/widgets/custom_button.dart';
import '../controllers/tech_controller.dart';
import '../utils/responsive_layout.dart';

class IntroWidget extends StatelessWidget {
  final GlobalKey? scrollKey;
  IntroWidget({super.key, this.scrollKey});
  final IntroController controller =
      Get.put(IntroController(), permanent: false);
  final TechController techController = Get.put(TechController());

  @override
  Widget build(BuildContext context) {
    controller.fetchImages();
    return Container(
      width: ResponsiveLayout.isDesktop(context) ? 1.sw : null,
      height: ResponsiveLayout.isDesktop(context) ? 1.sh : null,
      margin: EdgeInsets.only(bottom: 50.h),
      key: scrollKey,
      child: ResponsiveLayout.buildResponsive(
        context: context,
        mobile: _buildMobileLayout(context),
        tablet: _buildTabletLayout(context),
        desktop: _buildDesktopLayout(context),
      ),
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 30.h),
          CachedNetworkImage(
            imageUrl: controller.profilePic,
            width: 0.6.sw,
            height: 0.6.sw,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 50.h),
          _buildContent(context, techController),
        ],
      ),
    );
  }

  Widget _buildTabletLayout(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 30.h),
          CachedNetworkImage(
            imageUrl: controller.profilePic,
            width: 0.6.sw,
            height: 0.6.sw,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 50.h),
          _buildContent(context, techController),
        ],
      ),
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          right: 0.05.sw,
          top: 0.15.sh,
          child: CachedNetworkImage(
            imageUrl: controller.profilePic,
            width: 0.3.sw,
            height: 0.3.sw,
            fit: BoxFit.cover,
          ),
        ),
        _buildContent(context, techController),
      ],
    );
  }

  Widget _buildContent(BuildContext context, TechController techController) {
    double contentWidth;
    if (ResponsiveLayout.isMobile(context)) {
      contentWidth = 0.95.sw;
    } else if (ResponsiveLayout.isTablet(context)) {
      contentWidth = 0.95.sw;
    } else {
      contentWidth = 0.4.sw;
    }

    double buttonWidth;
    double buttonHeight;
    if (ResponsiveLayout.isMobile(context)) {
      buttonWidth = 0.8.sw;
      buttonHeight = 0.05.sh;
    } else if (ResponsiveLayout.isTablet(context)) {
      buttonWidth = 0.8.sw;
      buttonHeight = 0.05.sh;
    } else {
      buttonWidth = 0.2.sw;
      buttonHeight = 0.07.sh;
    }

    return SizedBox(
      width: contentWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Hi there,",
            softWrap: true,
            style: GoogleFonts.arizonia(
              color: AppColors.purple,
              fontSize: ResponsiveLayout.isMobile(context) ||
                      ResponsiveLayout.isTablet(context)
                  ? TextScaling.getScaledFontSize(context, 90)
                  : TextScaling.getScaledFontSize(context, 70),
            ),
          ),
          SizedBox(height: 12.h),
          Text(
            "I'm Shivam Savaliya",
            softWrap: true,
            style: GoogleFonts.poppins(
              fontSize: ResponsiveLayout.isMobile(context) ||
                      ResponsiveLayout.isTablet(context)
                  ? TextScaling.getScaledFontSize(context, 50)
                  : TextScaling.getScaledFontSize(context, 40),
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 14.h),
          SelectableText(
            "A Master's student in Computer Science at DePaul University, passionate about building innovative mobile apps with Flutter. With a Bachelor's in Computer Engineering from Silver Oak University and hands-on experience as a Flutter Developer, I specialize in creating responsive, user-friendly applications that solve real-world problems.",
            style: GoogleFonts.poppins(
              fontSize: ResponsiveLayout.isMobile(context) ||
                      ResponsiveLayout.isTablet(context)
                  ? TextScaling.getScaledFontSize(context, 24)
                  : TextScaling.getScaledFontSize(context, 20),
              color: Colors.white,
              height: 1.5,
            ),
          ),
          SizedBox(height: 38.h),
          if (ResponsiveLayout.isDesktop(context))
            Column(
              children: [
                _buildTechCarousel(context),
                SizedBox(height: 40.h),
              ],
            ),
          SizedBox(
            width: buttonWidth,
            height: buttonHeight,
            child: CustomButton(
              onTap: controller.downloadResume,
              title: 'Resume',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTechCarousel(BuildContext context) {
    return SizedBox(
      height: 0.1.sh,
      width: double.maxFinite,
      child: FutureBuilder(
        future: techController.fetchSvgImages(),
        builder: (context, snapshot) {
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("No data found."));
          }
          final svgList = snapshot.data!;
          return CarouselSlider.builder(
            itemCount: svgList.length,
            itemBuilder: (context, index, realIndex) {
              final svg = svgList[index];
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 5.w),
                padding: EdgeInsets.all(0.01.sw),
                decoration: BoxDecoration(
                  color: AppColors.sliderColor,
                  borderRadius: BorderRadius.circular(4.r),
                ),
                child: SvgPicture.memory(
                  svg.svgImage,
                  fit: BoxFit.contain,
                  width: 0.04.sw,
                  height: 0.04.sw,
                ),
              );
            },
            options: CarouselOptions(
              autoPlay: true,
              autoPlayInterval: const Duration(milliseconds: 2000),
              autoPlayAnimationDuration: const Duration(milliseconds: 2000),
              autoPlayCurve: Curves.linear,
              viewportFraction: 0.15,
              enableInfiniteScroll: true,
              scrollDirection: Axis.horizontal,
              height: 0.1.sh,
            ),
          );
        },
      ),
    );
  }
}
