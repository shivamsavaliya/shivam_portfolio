import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shivam_portfolio/controllers/home_controller.dart';
import 'package:shivam_portfolio/utils/app_colors.dart';
import 'package:shivam_portfolio/widgets/header.dart';
import 'package:shivam_portfolio/widgets/tech_widget.dart';
import 'package:shivam_portfolio/widgets/about_widget.dart';
import '../widgets/info_widget.dart';
import '../widgets/intro_widget.dart';
import '../utils/responsive_layout.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.bgColor,
        body: SizedBox(
          width: 1.sw,
          height: 1.sh,
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: ResponsiveLayout.responsivePadding(context),
              child: Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: ResponsiveLayout.isDesktop(context)
                        ? ResponsiveLayout.getMaxContentWidth(context)
                        : ResponsiveLayout.getMaxContentWidth(context) / 0.7,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      IntroWidget(scrollKey: controller.introWidget.value),
                      InfoWidget(scrollKey: controller.infoWidget.value),
                      if (ResponsiveLayout.isMobile(context))
                        TechWidget(scrollKey: controller.techWidget.value),
                      AboutWidget(scrollKey: controller.aboutWidget.value),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        floatingActionButton: ResponsiveLayout.isDesktop(context)
            ? Header(
                onProjectTap: () =>
                    controller.scrollToInfo(controller.infoWidget.value),
                onHomeTap: () =>
                    controller.scrollToInfo(controller.introWidget.value),
                onAboutTap: () =>
                    controller.scrollToInfo(controller.aboutWidget.value),
              )
            : null,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,
      ),
    );
  }
}
