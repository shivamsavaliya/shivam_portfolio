import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:shivam_portfolio/repo/data_repo.dart';
import '../utils/responsive_layout.dart';

class Header extends StatelessWidget {
  final VoidCallback? onProjectTap;
  final VoidCallback? onPorfolioTap;
  final VoidCallback? onTechTap;
  final VoidCallback? onAboutTap;

  const Header(
      {super.key,
      this.onProjectTap,
      this.onPorfolioTap,
      this.onTechTap,
      this.onAboutTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ResponsiveLayout.responsiveValue(
        context: context,
        desktop: 600,
        mobile: ResponsiveLayout.getScreenWidth(context),
      ),
      height: ResponsiveLayout.responsiveValue(
        context: context,
        desktop: 80,
        mobile: 50,
      ),
      margin: EdgeInsets.symmetric(
          vertical: 20,
          horizontal: ResponsiveLayout.getScreenWidth(context) * 0.05),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 34, vertical: 4),
            color: Colors.white.withValues(alpha: 0.08),
            child: Row(
              children: [
                GestureDetector(
                  onTap: onPorfolioTap,
                  child: Text(
                    "S.S. Portfolio",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: ResponsiveLayout.responsiveValue(
                        context: context,
                        desktop: 26,
                        mobile: 14,
                      ),
                    ),
                  ),
                ),
                Spacer(),
                ...DataRepo.headerData
                    .asMap()
                    .map(
                      (key, value) => MapEntry(
                        key,
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: GestureDetector(
                            onTap: () {
                              if (key == 0) {
                                onProjectTap!();
                              } else if (key == 1) {
                                onTechTap!();
                              } else if (key == 2) {
                                onAboutTap!();
                              }
                            },
                            child: Text(
                              value.title,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: ResponsiveLayout.responsiveValue(
                                  context: context,
                                  desktop: 14,
                                  mobile: 8,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                    .values,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
