import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shivam_portfolio/controllers/intro_controller.dart';
import 'package:shivam_portfolio/utils/app_colors.dart';
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
                _buildContent(context, techController),
              ],
            )
          : Stack(
              children: [
                _buildCircle(context),
                _buildProfileImage(context),
                _buildContent(context, techController),
              ],
            ),
    );
  }

  Widget _buildCircle(BuildContext context) {
    return Positioned(
      right: ResponsiveLayout.isMobile(context) ? 0 : 20,
      top: ResponsiveLayout.responsiveValue(context: context, desktop: 100),
      child: Container(
        width: 500,
        height: 500,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.transparent,
          border: Border.all(
            color: Colors.white,
            width: 1.5,
          ),
        ),
      ),
    );
  }

  Widget _buildProfileImage(BuildContext context) {
    return Positioned(
      right: ResponsiveLayout.isMobile(context) ? 0 : 40,
      top: ResponsiveLayout.responsiveValue(context: context, desktop: 50),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(100),
          bottomRight: Radius.circular(100),
        ),
        child: CachedNetworkImage(
          imageUrl: controller.profilePic,
          width: 460,
          height: 460,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context, TechController techController) {
    return SizedBox(
      width: ResponsiveLayout.responsiveValue(
        context: context,
        desktop: 550,
        mobile: 300,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 6,
        children: [
          Text(
            "Hi there,",
            softWrap: true,
            style: GoogleFonts.arizonia(
              color: AppColors.purple,
              fontSize: ResponsiveLayout.responsiveValue(
                context: context,
                desktop: 50,
                mobile: 30,
              ),
            ),
          ),
          Text(
            "I'm Shivam Savaliya",
            softWrap: true,
            style: TextStyle(
              fontSize: ResponsiveLayout.responsiveValue(
                context: context,
                desktop: 40,
                mobile: 30,
              ),
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "A Master's student in Computer Science at DePaul University, passionate about building innovative mobile apps with Flutter. With a Bachelor's in Computer Engineering from Silver Oak University and hands-on experience as a Flutter Developer, I specialize in creating responsive, user-friendly applications that solve real-world problems.",
              softWrap: true,
              style: TextStyle(
                color: Colors.white,
                fontSize: ResponsiveLayout.responsiveValue(
                  context: context,
                  desktop: 14,
                  mobile: 10,
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          ResponsiveLayout.isDesktop(context)
              ? SizedBox(
                  height: 80,
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
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: AppColors.sliderColor,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: SvgPicture.memory(
                              svg.svgImage,
                              fit: BoxFit.contain,
                              width: ResponsiveLayout.responsiveValue(
                                context: context,
                                desktop: 80,
                                mobile: 50,
                              ),
                              height: ResponsiveLayout.responsiveValue(
                                context: context,
                                desktop: 80,
                                mobile: 50,
                              ),
                            ),
                          );
                        },
                        options: CarouselOptions(
                          autoPlay: true,
                          autoPlayInterval: const Duration(milliseconds: 2000),
                          autoPlayAnimationDuration:
                              const Duration(milliseconds: 2000),
                          autoPlayCurve: Curves.linear,
                          viewportFraction: 0.2,
                          enableInfiniteScroll: true,
                          scrollDirection: Axis.horizontal,
                        ),
                      );
                    },
                  ),
                )
              : Container(),
          Container(
            margin: ResponsiveLayout.isDesktop(context)
                ? EdgeInsets.only(top: 30)
                : null,
            child: CustomButton(
              onTap: controller.downloadResume,
              title: 'Resume',
            ),
          ),
        ],
      ),
    );
  }
}
