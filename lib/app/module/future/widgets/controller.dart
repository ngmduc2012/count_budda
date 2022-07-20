import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextField2Controller extends GetxController {


  String? value;
  late TextEditingController controller;

  TextField2Controller({
    this.value = "",
  });

  @override
  void onInit() {
    controller = TextEditingController();
    if(value != null  )controller.text = value!;
    super.onInit();
  }

  @override
  onClose() {
    controller.dispose();
    super.onClose();
  }


}
