import 'dart:developer';
import 'package:get/get.dart';
import 'package:shivam_portfolio/utils/app_constants.dart';

class InfoController extends GetxController {
  Future<Map<String, List<String>>> fetchImages() async {
    final supabase = AppConstants.supabase.storage;

    try {
      final folders = await supabase.from('images').list();
      Map<String, List<String>> folderImages = {};

      for (var folder in folders) {
        final response = await supabase.from('images').list(path: folder.name);

        List<String> imageUrls = response
            .map((file) => supabase
                .from('images')
                .getPublicUrl('${folder.name}/${file.name}'))
            .toList();

        folderImages[folder.name] = imageUrls;
      }

      return folderImages;
    } catch (e) {
      log("Error fetching images: $e");
      return {};
    }
  }
}
