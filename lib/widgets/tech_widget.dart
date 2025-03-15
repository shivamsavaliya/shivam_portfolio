import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shivam_portfolio/controllers/tech_controller.dart';
import 'package:shivam_portfolio/utils/app_colors.dart';

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
          return Center(
              child: CircularProgressIndicator(color: AppColors.cyan));
        }
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }
        return SizedBox(
          height: 300,
          child: ListView.builder(
            key: scrollKey,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return Tooltip(
                message: snapshot.data![index].name,
                child: SvgPicture.memory(
                  snapshot.data![index].svgImage,
                  height: 150,
                  width: 150,
                ),
              );
            },
          ),
        );
      },
    );
  }
}
