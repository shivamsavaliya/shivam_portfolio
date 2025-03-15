import 'dart:developer';
import 'package:get/get.dart';
import 'package:shivam_portfolio/models/svgimage_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class TechController extends GetxController {
  Future<List<SvgImageModel>> fetchSvgImages() async {
    final supabase = Supabase.instance.client;
    final response = await supabase.storage.from('logos').list();
    List<SvgImageModel> svgImages = [];

    for (var file in response) {
      if (file.name.endsWith('.svg')) {
        try {
          final svgBytes =
              await supabase.storage.from('logos').download(file.name);
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
