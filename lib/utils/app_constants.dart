import 'package:supabase_flutter/supabase_flutter.dart';

class AppConstants {
  static final supabase = Supabase.instance.client;

  static const String githubUrl = 'https://github.com/shivamsavaliya';
  static const String linkedinUrl =
      'https://www.linkedin.com/in/shivam-savaliya/';
  static const String emailUrl = 'mailto:savaliyashivam2002@gmail.com';

  static const String aboutMe =
      "I'm Shivam Savaliya, a dedicated Flutter Developer with a strong focus on crafting smooth, responsive, and visually engaging mobile experiences. With a deep understanding of Dart and Flutter, I bring a keen eye for UI/UX and a passion for writing clean, maintainable code. I thrive in fast-paced environments, where innovation, performance, and user satisfaction are key. Whether it's architecting scalable applications or optimizing for performance, I approach every challenge with curiosity, precision and a growth mindset. I'm always exploring emerging technologies and pushing the boundaries of what mobile apps can deliver.";
}
