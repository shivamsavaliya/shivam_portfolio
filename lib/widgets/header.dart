import 'package:flutter/material.dart';
import 'package:shivam_portfolio/repo/data_repo.dart';
import 'package:shivam_portfolio/utils/app_colors.dart';
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
      width: ResponsiveLayout.getScreenWidth(context) * 0.8,
      height: ResponsiveLayout.getScreenHeight(context) * 0.1,
      margin: EdgeInsets.symmetric(
          vertical: 20,
          horizontal: ResponsiveLayout.getScreenWidth(context) * 0.05),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(6)),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 34, vertical: 4),
          color: AppColors.headerColor,
          child: Row(
            children: [
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
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
              ),
              Spacer(),
              ...DataRepo.headerData
                  .asMap()
                  .map(
                    (key, value) => MapEntry(
                      key,
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: MouseRegion(
                          cursor: SystemMouseCursors.click,
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
                    ),
                  )
                  .values,
            ],
          ),
        ),
      ),
    );
  }
}
