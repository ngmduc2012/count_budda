import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'controller.dart';

class TextField2 extends GetView {
  final String tag;
  final ValueChanged<String?>? onChanged;
  final String? value;
  final String? unit;
  const TextField2({
    Key? key,
    required this.tag,
    this.unit,
    this.onChanged,
    this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TextField2Controller>(
        tag: tag,
      init: TextField2Controller(
        value: value
      ),
        builder: (_) {
          return TextField(
            keyboardType: TextInputType.number,
            onChanged: onChanged,
            controller: _.controller,
            textAlign: TextAlign.center,
            decoration:  InputDecoration(
              border: InputBorder.none,
              hintText: unit,
            ),
          );
        });
  }
}
