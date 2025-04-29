import 'package:get/get.dart';

class HomeController extends GetxController {
  // Add your reactive variables here
  var count = 0.obs;

  // Add your methods here
  void increment() {
    count++;
  }

  @override
  void onClose() {
    // Clean up resources here if needed
    super.onClose();
  }
}
