import 'package:flutter/material.dart';
import 'package:shivam_portfolio/utils/app_constants.dart';
import '../utils/responsive_layout.dart';

class CustomCard extends StatelessWidget {
  final String title;
  final String descripction;
  const CustomCard(
      {super.key, required this.title, required this.descripction});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      spacing: 20,
      children: [
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
        Text(
          descripction,
          softWrap: true,
          style: TextStyle(
            fontSize: ResponsiveLayout.responsiveValue(
              context: context,
              desktop: AppConstants.bodyDesktop,
              tablet: AppConstants.bodyDesktop * 0.8,
              mobile: AppConstants.bodyMobile,
              smallMobile: AppConstants.bodyMobile * 0.9,
            ),
            color: Colors.white.withValues(alpha: 0.5),
          ),
        ),
      ],
    );
  }
}
