import 'package:flutter/material.dart';
import 'package:shivam_portfolio/utils/app_colors.dart';
import 'package:shivam_portfolio/utils/responsive_layout.dart';
import 'package:simple_icons/simple_icons.dart';
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
      child: ResponsiveLayout.isDesktop(context)
          ? _buildDesktopLayout(context)
          : _buildMobileLayout(context),
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildProfileSection(context),
        SizedBox(width: 80),
        Expanded(child: _buildInfoSection(context)),
      ],
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      children: [
        _buildProfileSection(context),
        SizedBox(height: 40),
        _buildInfoSection(context),
      ],
    );
  }

  Widget _buildProfileSection(BuildContext context) {
    return SizedBox(
      width: ResponsiveLayout.isDesktop(context)
          ? ResponsiveLayout.getScreenWidth(context) * 0.25
          : ResponsiveLayout.getScreenWidth(context) * 0.6,
      child: Column(
        children: [
          ClipOval(
            child: Image.asset(
              'images/profile.png',
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 30),
          _buildSocialButtons(),
        ],
      ),
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
        "I am a passionate Flutter Developer with expertise in building dynamic, scalable and high-performance cross-platform applications. With hands-on experience in state management (GetX, BLoC, Provider), responsive UI and REST API integration, I create seamless user experiences. I also have a strong background in working with databases (SQL, Firebase) and WebSockets for real-time communication.\n\nI have developed multiple applications and have experience deploying apps on both the App Store(TestFlight) and Play Store. My problem-solving skills and dedication to clean, maintainable code allow me to bring ideas to life efficiently.\n\nI am currently pursuing a Master's in Computer Science at DePaul University, where I am expanding my knowledge in software development, databases and advanced computing concepts.",
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
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildSocialButton(
            SimpleIcons.github, 'https://github.com/YourUsername'),
        SizedBox(width: 20),
        _buildSocialButton(
            SimpleIcons.linkerd, 'https://linkedin.com/in/YourUsername'),
        SizedBox(width: 20),
        _buildSocialButton(SimpleIcons.gmail, 'mailto:your.email@gmail.com'),
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
          child: Icon(
            icon,
            color: Colors.white,
            size: 20,
          ),
        ),
      ),
    );
  }
}
