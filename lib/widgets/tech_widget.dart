import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shivam_portfolio/controllers/tech_controller.dart';
import 'package:shivam_portfolio/utils/responsive_layout.dart';

class TechWidget extends StatelessWidget {
  final GlobalKey? scrollKey;
  TechWidget({super.key, this.scrollKey});

  final TechController controller = TechController();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: controller.fetchSvgImages(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container();
        }
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }
        return Container(
          key: scrollKey,
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          margin: EdgeInsets.symmetric(
            vertical: ResponsiveLayout.responsiveValue(
              context: context,
              desktop: 100,
              tablet: 60,
              mobile: 40,
              smallMobile: 30,
            ),
            horizontal: ResponsiveLayout.responsiveValue(
              context: context,
              desktop: 180,
              tablet: 60,
              mobile: 40,
              smallMobile: 30,
            ),
          ),
          alignment: Alignment.center,
          child: Column(
            spacing: 50,
            children: [
              Text(
                'The tools and tehcnology that I use',
                style: TextStyle(
                  fontSize: ResponsiveLayout.responsiveValue(
                    context: context,
                    desktop: 40,
                    tablet: 30,
                    mobile: 20,
                    smallMobile: 15,
                  ),
                  color: Colors.white,
                ),
              ),
              Wrap(
                spacing: ResponsiveLayout.responsiveValue(
                  context: context,
                  desktop: 80,
                  tablet: 60,
                  mobile: 40,
                  smallMobile: 30,
                ),
                runSpacing: ResponsiveLayout.responsiveValue(
                  context: context,
                  desktop: 50,
                  tablet: 60,
                  mobile: 40,
                  smallMobile: 30,
                ),
                runAlignment: WrapAlignment.center,
                alignment: WrapAlignment.center,
                children: [
                  ...snapshot.data!.asMap().entries.map((entry) {
                    final svg = entry.value;
                    return Tooltip(
                      message: svg.name,
                      child: SvgPicture.memory(
                        svg.svgImage,
                        height: ResponsiveLayout.responsiveValue(
                          context: context,
                          desktop: 80,
                          tablet: 60,
                          mobile: 40,
                          smallMobile: 30,
                        ),
                        width: ResponsiveLayout.responsiveValue(
                          context: context,
                          desktop: 80,
                          tablet: 60,
                          mobile: 40,
                          smallMobile: 30,
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
