import 'package:get/get.dart';

import '../controller/finished_controller.dart';

class FinishBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FinishedController>(() => FinishedController());
  }
}
