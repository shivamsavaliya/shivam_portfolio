import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../utils/app_colors.dart';
import '../controllers/hover_controller.dart';

class HoverCard extends StatelessWidget {
  final Widget child;
  final Key? scrollKey;
  final String id;

  HoverCard({
    super.key,
    required this.child,
    this.scrollKey,
  }) : id = UniqueKey().toString() {
    Get.put(HoverController(id), tag: id);
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HoverController>(tag: id);

    return MouseRegion(
      onEnter: (_) => controller.setHovered(true),
      onExit: (_) => controller.setHovered(false),
      child: Obx(
        () => AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          transform: Matrix4.identity()
            ..scale(controller.isHovered ? 1.03 : 1.0),
          child: Card(
            elevation: controller.isHovered ? 12 : 6,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Container(
              padding: const EdgeInsets.all(20),
              key: scrollKey,
              decoration: BoxDecoration(
                color: AppColors.bgColor,
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
