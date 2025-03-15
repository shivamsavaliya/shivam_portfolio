import 'package:flutter/material.dart';
import 'package:shivam_portfolio/controllers/home_controller.dart';
import 'package:shivam_portfolio/repo/data_repo.dart';
import '../utils/responsive_layout.dart';
import 'custom_card.dart';
import 'hover_card.dart';

class InfoWidget extends StatelessWidget {
  final GlobalKey? scrollKey;

  InfoWidget({super.key, this.scrollKey});

  final HomeController controller = HomeController();
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      key: controller.infoWidget.value,
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: ResponsiveLayout.isMobile(context) ? 1 : 2,
        crossAxisSpacing: 30,
        mainAxisSpacing: 30,
        childAspectRatio: 1,
      ),
      itemCount: DataRepo.projectData.length,
      itemBuilder: (context, index) => HoverCard(
        key: ValueKey('card_$index'),
        scrollKey: index == 0 ? scrollKey : null,
        child: CustomCard(
          title: DataRepo.projectData[index].title,
          image: '',
        ),
      ),
    );
  }
}
