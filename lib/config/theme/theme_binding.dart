import 'package:get/get.dart';
import 'package:note_app/config/theme/theme_controller.dart';

class ThemeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ThemeController>(ThemeController());
  }
}
