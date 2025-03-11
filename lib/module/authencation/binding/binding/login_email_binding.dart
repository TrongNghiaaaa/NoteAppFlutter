import 'package:get/get.dart';
import 'package:note_app/module/authencation/controller/login_phone_number_controller.dart';

class LoginEmailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginPhoneNumberController>(() => LoginPhoneNumberController());
  }
}
