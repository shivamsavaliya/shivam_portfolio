import 'package:get/get.dart';

class HoverController extends GetxController {
  final String id;
  final _isHovered = false.obs;

  HoverController(this.id);

  bool get isHovered => _isHovered.value;

  void setHovered(bool value) => _isHovered.value = value;
}
