import 'package:flutter/material.dart';
import 'package:shivam_portfolio/utils/app_constants.dart';
import '../utils/responsive_layout.dart';

class CustomCard extends StatelessWidget {
  final String title;
  const CustomCard({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final spacing = ResponsiveLayout.responsiveSpacing(context);

    return Container(
      constraints: BoxConstraints(
        minHeight: ResponsiveLayout.responsiveValue(
          context: context,
          desktop: 400,
          tablet: 350,
          mobile: 300,
          smallMobile: 250,
        ),
      ),
      padding: EdgeInsets.all(ResponsiveLayout.responsiveValue(
        context: context,
        desktop: 24,
        tablet: 20,
        mobile: 16,
        smallMobile: 12,
      )),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FlutterLogo(
            size: ResponsiveLayout.responsiveValue(
              context: context,
              desktop: 200,
              tablet: 200,
              mobile: 200,
              smallMobile: 50,
            ),
            style: FlutterLogoStyle.stacked,
          ),
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
      ),
    );
  }
}
