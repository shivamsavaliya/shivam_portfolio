import 'package:cached_network_image/cached_network_image.dart';
import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';
import 'package:shivam_portfolio/controllers/home_controller.dart';
import 'package:shivam_portfolio/controllers/info_controller.dart';
import 'package:shivam_portfolio/models/data_model.dart';
import 'package:shivam_portfolio/repo/data_repo.dart';
import 'package:shivam_portfolio/utils/app_colors.dart';
import '../utils/responsive_layout.dart';
import 'custom_card.dart';
import 'hover_card.dart';

class InfoWidget extends StatelessWidget {
  final GlobalKey? scrollKey;

  InfoWidget({super.key, this.scrollKey});

  final HomeController controller = HomeController();
  final InfoController infocontroller = InfoController();
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, List<String>>>(
      future: infocontroller.fetchImages(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container();
        }
        if (snapshot.hasError) {
          return Center(child: Text('Failed to load folders and images'));
        }

        final folderData = snapshot.data!;

        return GridView.builder(
          key: controller.infoWidget.value,
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: ResponsiveLayout.isMobile(context) ? 1 : 2,
            crossAxisSpacing: 30,
            mainAxisSpacing: 30,
            mainAxisExtent: ResponsiveLayout.getScreenHeight(context) * 0.4,
          ),
          itemCount: folderData.keys.length,
          itemBuilder: (context, index) {
            String folderName = folderData.keys.elementAt(index);
            DataModel desc = DataRepo.projectData
                .firstWhere((element) => element.title == folderName);

            return HoverCard(
              key: ValueKey('card_$index'),
              scrollKey: index == 0 ? scrollKey : null,
              child: InkWell(
                onTap: () => appImageDialog(context, folderName),
                child: CustomCard(
                  title: folderName,
                  descripction: desc.content,
                ),
              ),
            );
          },
        );
      },
    );
  }

  //  controller.isHovered
  //                 ? Center(
  //                     child: Text(
  //                     "Click to view",
  //                     style: TextStyle(
  //                       fontSize: ResponsiveLayout.responsiveValue(
  //                         context: context,
  //                         desktop: 30,
  //                         mobile: 16,
  //                       ),
  //                       fontWeight: FontWeight.w600,
  //                       color: Colors.white,
  //                     ),
  //                   ))
  //                 :

  Future<dynamic> appImageDialog(BuildContext context, String folderName) {
    return showAdaptiveDialog(
      context: context,
      useSafeArea: true,
      builder: (context) => FutureBuilder(
        future: infocontroller.fetchImages(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Failed to load images'));
          }

          List<String> folderImages = snapshot.data![folderName]!;
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                color: AppColors.purple,
                iconSize: 40,
                onPressed: () {
                  if (pageController.page == 0) return;
                  pageController.previousPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
                icon: Icon(Icons.arrow_circle_left_outlined),
              ),
              SizedBox(
                width: ResponsiveLayout.responsiveValue(
                  context: context,
                  desktop: 300,
                  tablet: 250,
                  mobile: 250,
                  smallMobile: 150,
                ),
                height: ResponsiveLayout.responsiveValue(
                  context: context,
                  desktop: 600,
                  tablet: 400,
                  mobile: 500,
                  smallMobile: 350,
                ),
                child: DeviceFrame(
                  device: Devices.ios.iPhone13,
                  screen: SizedBox(
                    width: double.maxFinite,
                    height: double.maxFinite,
                    child: PageView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      controller: pageController,
                      scrollDirection: Axis.horizontal,
                      itemCount: folderImages.length,
                      itemBuilder: (context, index) {
                        return Center(
                          child: CachedNetworkImage(
                            imageUrl: folderImages[index],
                            placeholder: (context, url) =>
                                Center(child: CircularProgressIndicator()),
                            errorWidget: (context, url, error) =>
                                Center(child: Icon(Icons.error)),
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: double.infinity,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              IconButton(
                color: AppColors.purple,
                iconSize: 40,
                onPressed: () {
                  if (pageController.page == folderImages.length - 1) {
                    Navigator.pop(context);
                    return;
                  }
                  pageController.nextPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
                icon: Icon(Icons.arrow_circle_right_outlined),
              ),
            ],
          );
        },
      ),
    );
  }
}
