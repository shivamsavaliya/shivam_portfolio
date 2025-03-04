import 'package:flutter/material.dart';
import 'package:shivam_portfolio/controllers/home_controller.dart';
import '../utils/app_colors.dart';
import '../utils/responsive_layout.dart';
import 'custom_button.dart';

class InfoWidget extends StatelessWidget {
  final GlobalKey? scrollKey;

  const InfoWidget({super.key, this.scrollKey});

  @override
  Widget build(BuildContext context) {
    HomeController controller = HomeController();

    return GridView.builder(
      key: controller.infoWidget.value,
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: ResponsiveLayout.responsiveValue(
            context: context, desktop: 600, mobile: 300),
        crossAxisSpacing: ResponsiveLayout.responsiveValue(
            context: context, desktop: 30, mobile: 10),
        mainAxisSpacing: ResponsiveLayout.responsiveValue(
            context: context, desktop: 30, mobile: 10),
      ),
      itemCount: 5,
      itemBuilder: (context, index) => Container(
        key: index == 0 ? scrollKey : null,
        padding: const EdgeInsets.all(36),
        decoration: BoxDecoration(
          color: AppColors.bgColor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: AppColors.cyan,
              blurRadius: 10,
              spreadRadius: .01,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 30,
          children: [
            Center(
              child: FlutterLogo(
                size: 100,
                style: FlutterLogoStyle.stacked,
              ),
            ),
            Text(
              "Flutter Developer",
              softWrap: true,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
            Text(
              "I enjoy building great apps using Flutter. I'm really good at managing how things work and making designs that fit any screen. I've finished lots of projects that show how creative and helpful I can be.",
              softWrap: true,
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.5),
              ),
            ),
            Spacer(),
            Center(
              child: CustomButton(
                onTap: () {},
                title: 'Show',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
