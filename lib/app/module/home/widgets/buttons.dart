import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

///Giao diện các nút bầm +/-1 +/-5 +/-10
class ElevatedCard extends StatelessWidget {
   ElevatedCard({
    Key? key,
    required  this.width,
    required this.height,
     required this.color,
     required this.text,
     required this.colorText
  }) : super(
          key: key,
        );
  double width;
  double height;
   Color color;
   String text;
   Color colorText;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        color: color,
        child: SizedBox(
          width: width,
          height: height,
          child: Center(
              child: Text(
            text,
            style: TextStyle(fontSize: 40, color: colorText),
          )),
        ),
      ),
    );
  }
}

