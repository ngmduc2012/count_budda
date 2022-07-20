import 'package:get/get.dart';

import 'controller.dart';

class FutureBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(FutureController());
  }
}
