import 'package:flutter/services.dart';

class SvgImageModel {
  final String name;
  final Uint8List svgImage;

  SvgImageModel({required this.name, required this.svgImage});

  SvgImageModel.fromUint8List(Uint8List imageData)
      : name = '',
        svgImage = imageData;
}
