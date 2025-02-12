import 'package:get/get.dart';
import 'package:note_app/module/home/authencation/register_controller.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterController>(() => RegisterController());
  }
}
