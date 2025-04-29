import 'package:get/get.dart';

import '../controller/login_phone_number_controller.dart';

class LoginEmailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginPhoneNumberController>(() => LoginPhoneNumberController());
  }
}
