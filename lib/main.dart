import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mouse_follower/mouse_follower.dart';
import 'package:shivam_portfolio/screens/home_screen.dart';
import 'package:shivam_portfolio/utils/app_constants.dart';
import 'package:shivam_portfolio/utils/responsive_layout.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  await Supabase.initialize(
    url: 'URL',
    anonKey: 'KEY',
  );

  AppConstants.supabase;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1440, 900),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) => MaterialApp(
        theme: ThemeData(
          fontFamily: 'Poppins',
        ),
        title: 'Shivam Savaliya',
        debugShowCheckedModeBanner: false,
        home: MouseFollower(
          defaultMouseCursor: MouseCursor.defer,
          isVisible: ResponsiveLayout.isDesktop(context),
          mouseStylesStack: [
            MouseStyle(
              size: const Size(30, 30),
              latency: const Duration(milliseconds: 100),
              visibleOnHover: false,
              decoration: BoxDecoration(
                color: Colors.transparent,
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.white,
                  width: 1.5,
                ),
              ),
            ),
          ],
          child: HomeScreen(),
        ),
      ),
    );
  }
}
