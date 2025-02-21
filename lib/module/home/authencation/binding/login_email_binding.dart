import 'package:get/get.dart';
import 'package:note_app/module/home/authencation/login_phone_number_controller.dart';

class LoginEmailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginPhoneNumberController>(() => LoginPhoneNumberController());
  }
}
