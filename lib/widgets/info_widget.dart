import 'package:cached_network_image/cached_network_image.dart';
import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
          return Center(
            child: Text(
              'Failed to load folders and images',
              style: TextStyle(fontSize: 14.sp),
            ),
          );
        }

        final folderData = snapshot.data!;

        return GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          key: controller.infoWidget.value,
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: ResponsiveLayout.isMobile(context) ? 1 : 2,
            crossAxisSpacing: 0.03.sw,
            mainAxisSpacing: 0.03.sh,
            mainAxisExtent: ResponsiveLayout.isDesktop(context)
                ? 0.5.sh
                : ResponsiveLayout.isTablet(context)
                    ? 0.4.sh
                    : 0.3.sh,
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

  Future<dynamic> appImageDialog(BuildContext context, String folderName) {
    return showAdaptiveDialog(
      context: context,
      useSafeArea: true,
      builder: (context) => FutureBuilder(
        future: infocontroller.fetchImages(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                strokeWidth: 2.w,
              ),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text(
                'Failed to load images',
                style: TextStyle(fontSize: 14.sp),
              ),
            );
          }

          List<String> folderImages = snapshot.data![folderName]!;
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                color: AppColors.purple,
                iconSize: ResponsiveLayout.isMobile(context) ? 90.w : 40.w,
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
                width: ResponsiveLayout.isMobile(context) ? 0.6.sw : 400.w,
                height: ResponsiveLayout.isMobile(context) ? 0.6.sh : 700.h,
                child: DeviceFrame(
                  device: Devices.android.samsungGalaxyNote20Ultra,
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
                            placeholder: (context, url) => Center(
                              child: CircularProgressIndicator(
                                strokeWidth: 2.w,
                              ),
                            ),
                            errorWidget: (context, url, error) => Center(
                              child: Icon(
                                Icons.error,
                                size: 24.w,
                              ),
                            ),
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
                iconSize: ResponsiveLayout.isMobile(context) ? 90.w : 40.w,
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
