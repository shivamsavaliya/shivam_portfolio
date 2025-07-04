import 'dart:developer';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../utils/app_constants.dart';

class IntroController extends GetxController {
  String profilePic = '';
  String namePic = '';

  void downloadResume() async {
    final String fileName = "ShivamResume.pdf";
    final String fileUrl =
        AppConstants.supabase.storage.from("resume").getPublicUrl(fileName);

    if (await canLaunchUrl(Uri.parse(fileUrl))) {
      await launchUrl(Uri.parse(fileUrl), mode: LaunchMode.externalApplication);
    } else {
      log("Could not launch URL");
    }
  }

  void fetchImages() async {
    final supabase = AppConstants.supabase.storage;
    profilePic = supabase.from('resume').getPublicUrl('profile.png');
  }
}
