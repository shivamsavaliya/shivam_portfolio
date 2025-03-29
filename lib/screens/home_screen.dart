import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: ResponsiveLayout.responsivePadding(context),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                IntroWidget(scrollKey: controller.introWidget.value),
                InfoWidget(scrollKey: controller.infoWidget.value),
                TechWidget(scrollKey: controller.techWidget.value),
                AboutWidget(scrollKey: controller.aboutWidget.value),
              ],
            ),
          ),
        ),
        floatingActionButton: ResponsiveLayout.isDesktop(context)
            ? Header(
                onProjectTap: () =>
                    controller.scrollToInfo(controller.infoWidget.value),
                onPorfolioTap: () =>
                    controller.scrollToInfo(controller.introWidget.value),
                onTechTap: () =>
                    controller.scrollToInfo(controller.techWidget.value),
                onAboutTap: () =>
                    controller.scrollToInfo(controller.aboutWidget.value),
              )
            : Container(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,
      ),
    );
  }
}
