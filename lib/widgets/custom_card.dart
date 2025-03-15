import 'package:flutter/material.dart';
import 'package:shivam_portfolio/utils/app_constants.dart';
import '../utils/responsive_layout.dart';

class CustomCard extends StatelessWidget {
  final String title;
  final String image;
  const CustomCard({super.key, required this.title, required this.image});

  @override
  Widget build(BuildContext context) {
    final spacing = ResponsiveLayout.responsiveSpacing(context);

    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // SvgPicture.network(image),
        SizedBox(height: spacing),
        Text(
          title,
          softWrap: true,
          style: TextStyle(
            fontSize: ResponsiveLayout.responsiveValue(
              context: context,
              desktop: AppConstants.headingDesktop,
              tablet: AppConstants.headingDesktop * 0.8,
              mobile: AppConstants.headingMobile,
              smallMobile: AppConstants.headingMobile * 0.9,
            ),
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
