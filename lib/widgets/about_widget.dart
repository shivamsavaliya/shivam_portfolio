import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shivam_portfolio/utils/app_colors.dart';
import 'package:shivam_portfolio/utils/app_constants.dart';
import 'package:shivam_portfolio/utils/responsive_layout.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutWidget extends StatelessWidget {
  final GlobalKey? scrollKey;
  const AboutWidget({super.key, this.scrollKey});

  @override
  Widget build(BuildContext context) {
    return Container(
      key: scrollKey,
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: ResponsiveLayout.responsiveValue(
          context: context,
          desktop: 100,
          tablet: 60,
          mobile: 20,
          smallMobile: 15,
        ),
        vertical: 50,
      ),
      color: Colors.transparent,
      child: _buildMobileLayout(context),
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      spacing: 40,
      children: [
        _buildInfoSection(context),
        _buildSocialButtons(),
      ],
    );
  }

  Widget _buildInfoSection(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.03),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        AppConstants.aboutMe,
        style: TextStyle(
          fontSize: ResponsiveLayout.responsiveValue(
            context: context,
            desktop: 16,
            tablet: 15,
            mobile: 14,
            smallMobile: 13,
          ),
          color: Colors.white70,
          height: 1.8,
          letterSpacing: 0.5,
        ),
      ),
    );
  }

  Widget _buildSocialButtons() {
    return Row(
      spacing: 20,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildSocialButton(FontAwesomeIcons.github, AppConstants.githubUrl),
        _buildSocialButton(
            FontAwesomeIcons.linkedinIn, AppConstants.linkedinUrl),
        _buildSocialButton(FontAwesomeIcons.envelope, AppConstants.emailUrl),
      ],
    );
  }

  Widget _buildSocialButton(IconData icon, String url) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => launchUrl(Uri.parse(url)),
        child: Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.05),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: AppColors.purple.withValues(alpha: 0.3),
              width: 1,
            ),
          ),
          child: FaIcon(
            icon,
            color: Colors.white,
            size: 20,
          ),
        ),
      ),
    );
  }
}
