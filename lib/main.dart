import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mouse_follower/mouse_follower.dart';
import 'package:shivam_portfolio/screens/home_screen.dart';
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
      home: MouseFollower(
        defaultMouseCursor: MouseCursor.uncontrolled,
        mouseStylesStack: [
          MouseStyle(
            size: const Size(26, 26),
            latency: const Duration(milliseconds: 75),
            visibleOnHover: false,
            decoration: BoxDecoration(
              color: Colors.transparent,
              shape: BoxShape.circle,
              border: Border.all(
                color: Theme.of(context).primaryColor,
                width: 1.5,
              ),
            ),
          ),
        ],
        child: HomeScreen(),
      ),
    );
  }
}
