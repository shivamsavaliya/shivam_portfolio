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

  static const String githubUrl = 'https://github.com/shivamsavaliya';
  static const String linkedinUrl =
      'https://www.linkedin.com/in/shivam-savaliya/';
  static const String emailUrl = 'mailto:savaliyashivam2002@gmail.com';

  static const String aboutMe =
      "I am a passionate Flutter Developer with expertise in building dynamic, scalable and high-performance cross-platform applications. With hands-on experience in state management (GetX, BLoC, Provider), responsive UI and REST API integration, I create seamless user experiences. I also have a strong background in working with databases (SQL, Firebase) and WebSockets for real-time communication.\n\nI have developed multiple applications and have experience deploying apps on both the App Store(TestFlight) and Play Store. My problem-solving skills and dedication to clean, maintainable code allow me to bring ideas to life efficiently.\n\nI am currently pursuing a Master's in Computer Science at DePaul University, where I am expanding my knowledge in software development, databases and advanced computing concepts.";
}
