import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shivam_portfolio/screens/home_screen.dart';
import 'package:shivam_portfolio/utils/app_constants.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
//  await dotenv.load(fileName: '.env');

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
      home: HomeScreen(),
    );
  }
}
