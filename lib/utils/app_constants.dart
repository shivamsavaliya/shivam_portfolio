import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AppConstants {
  static const double mobileBreakpoint = 600;
  static const double tabletBreakpoint = 1200;

  static const double desktopPadding = 80.0;
  static const double tabletPadding = 40.0;
  static const double mobilePadding = 20.0;

  static const double headingDesktop = 32.0;
  static const double headingMobile = 24.0;
  static const double bodyDesktop = 16.0;
  static const double bodyMobile = 14.0;

  static String get url => dotenv.env['SUPABASE_URL']!;
  static String get anonKey => dotenv.env['SUPABASE_ANON_KEY']!;

  static final supabase = Supabase.instance.client;

  static const String githubUrl = 'https://github.com/YourUsername';
  static const String linkedinUrl = 'https://linkedin.com/in/YourUsername';
  static const String emailUrl = 'mailto:your.email@gmail.com';
}
