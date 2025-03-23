import 'package:flutter/material.dart';
import 'package:shivam_portfolio/utils/app_colors.dart';
import 'package:shivam_portfolio/utils/responsive_layout.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutWidget extends StatelessWidget {
  final GlobalKey? scrollKey;

  const AboutWidget({super.key, this.scrollKey});

  @override
  Widget build(BuildContext context) {
    return Container(
      key: scrollKey,
      width: ResponsiveLayout.isMobile(context)
          ? ResponsiveLayout.getScreenWidth(context)
          : ResponsiveLayout.getScreenWidth(context) * 0.5,
      height: ResponsiveLayout.getScreenHeight(context),
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      margin: EdgeInsets.symmetric(
        vertical: ResponsiveLayout.responsiveValue(
          context: context,
          desktop: 100,
          tablet: 60,
          mobile: 40,
          smallMobile: 30,
        ),
      ),
      child: Column(
        children: [
          Text(
            'About Me',
            style: TextStyle(
              fontSize: ResponsiveLayout.responsiveValue(
                context: context,
                desktop: 40,
                tablet: 30,
                mobile: 25,
                smallMobile: 20,
              ),
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 30),
          Text(
            'I am a passionate Flutter developer with expertise in creating beautiful and functional cross-platform applications. My journey in mobile development has equipped me with strong problem-solving skills and attention to detail.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: ResponsiveLayout.responsiveValue(
                context: context,
                desktop: 18,
                tablet: 16,
                mobile: 14,
                smallMobile: 12,
              ),
              color: Colors.white70,
            ),
          ),
          SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildSocialButton(
                'GitHub',
                Icons.code,
                'https://github.com/YourUsername',
              ),
              SizedBox(width: 20),
              _buildSocialButton(
                'LinkedIn',
                Icons.work,
                'https://linkedin.com/in/YourUsername',
              ),
              SizedBox(width: 20),
              _buildSocialButton(
                'Gmail',
                Icons.email,
                'mailto:your.email@gmail.com',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSocialButton(String label, IconData icon, String url) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => launchUrl(Uri.parse(url)),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [AppColors.purple, AppColors.cyan],
            ),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, color: Colors.white, size: 20),
              SizedBox(width: 8),
              Text(
                label,
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
