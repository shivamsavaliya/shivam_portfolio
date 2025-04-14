import 'dart:async';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:shivam_portfolio/models/svgimage_model.dart';
import '../utils/app_constants.dart';

class TechController extends GetxController {
  Future<List<SvgImageModel>> fetchSvgImages() async {
    final response = await AppConstants.supabase.storage.from('logos').list();
    List<SvgImageModel> svgImages = [];

    for (var file in response) {
      if (file.name.endsWith('.svg')) {
        try {
          final svgBytes = await AppConstants.supabase.storage
              .from('logos')
              .download(file.name);
          svgImages.add(SvgImageModel(
            name: file.name.split('.').first,
            svgImage: svgBytes,
          ));
        } catch (e) {
          log("Error downloading ${file.name}: $e");
        }
      }
    }
    return svgImages;
  }
}
