import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:flutter_tilt/flutter_tilt.dart';
import 'package:shivam_portfolio/screens/home_screen.dart';
import 'package:shivam_portfolio/utils/app_colors.dart';
import 'package:shivam_portfolio/utils/app_constants.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  await dotenv.load(fileName: '.env');
  await Supabase.initialize(
    url: AppConstants.url,
    anonKey: AppConstants.anonKey,
  );

  AppConstants.supabase;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Poppins',
      ),
      title: 'Shivam Savaliya',
      debugShowCheckedModeBanner: false,
      home: Tilt(
        tiltConfig: const TiltConfig(
          disable: true,
        ),
        lightConfig: LightConfig(
          enableReverse: true,
          color: AppColors.cyan.withValues(alpha: 0.1),
          spreadFactor: 1,
          direction: LightDirection.all,
        ),
        child: HomeScreen(),
      ),
    );
  }
}
