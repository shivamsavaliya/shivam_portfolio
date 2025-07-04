import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/responsive_layout.dart';
import '../utils/text_scaling.dart';

class CustomCard extends StatelessWidget {
  final String title;
  final String descripction;
  const CustomCard(
      {super.key, required this.title, required this.descripction});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          title,
          softWrap: true,
          style: TextScaling.heading3(context),
        ),
        SizedBox(height: ResponsiveLayout.isMobile(context) ? 10.h : 0),
        Flexible(
          child: Text(
            descripction,
            softWrap: true,
            style:
                TextScaling.body(context, color: Colors.white.withOpacity(0.5)),
          ),
        ),
      ],
    );
  }
}
