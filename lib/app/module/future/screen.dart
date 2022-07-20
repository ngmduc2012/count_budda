import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:nam_mo_a_di_da_phat/app/module/future/widgets/textField.dart';
import '../../../core/values/colors.dart';
import '../../../core/values/languages/translations.dart';
import '../../../core/values/text_style.dart';
import 'controller.dart';

class FutureScreen extends GetView<FutureController> {
  const FutureScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FutureController>(builder: (controller) {
      return Scaffold(
          appBar: AppBar(
            title: const ListTile(
              title: Text(
                "Future",
                style: styleTitle,
                textAlign: TextAlign.center,
              ),
              trailing: Text(""),
            ),
            flexibleSpace: const Image(
              image: AssetImage("assets/images/bg_appbar.png"),
              fit: BoxFit.cover,
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                SizedBox(
                  height: 20,
                ),
                controller.isShort
                    ? Table(
                        border: TableBorder.all(
                            color: controller.isShort
                                ? AppColors.colorTable3
                                : AppColors.colorTable4),
                        columnWidths: const <int, TableColumnWidth>{
                          0: FixedColumnWidth(81),
                        },
                        defaultVerticalAlignment:
                            TableCellVerticalAlignment.middle,
                        children: <TableRow>[
                          TableRow(
                            children: <Widget>[
                              TableCell(
                                verticalAlignment:
                                    TableCellVerticalAlignment.top,
                                child: Container(
                                  height: 64,
                                  color: AppColors.colorTable0,
                                ),
                              ),
                              TableCell(
                                verticalAlignment:
                                    TableCellVerticalAlignment.top,
                                child: Container(
                                  height: 64,
                                  color: AppColors.colorTable0,
                                  child: Center(child: Text("%Future")),
                                ),
                              ),
                              TableCell(
                                verticalAlignment:
                                    TableCellVerticalAlignment.top,
                                child: Container(
                                  height: 64,
                                  color: AppColors.colorTable0,
                                  child: Center(child: Text("%Sport")),
                                ),
                              ),
                              TableCell(
                                verticalAlignment:
                                    TableCellVerticalAlignment.top,
                                child: Container(
                                  height: 64,
                                  color: AppColors.colorTable0,
                                  child: Center(child: Text("Giá")),
                                ),
                              ),
                            ],
                          ),
                          TableRow(
                            // decoration: const BoxDecoration(
                            //   color: Colors.grey,
                            // ),
                            children: <Widget>[
                              TableCell(
                                verticalAlignment:
                                    TableCellVerticalAlignment.top,
                                child: Container(
                                  height: 64,
                                  color: AppColors.colorTable0,
                                  child: Center(child: Text("Giá thanh lý")),
                                ),
                              ),
                              TableCell(
                                verticalAlignment:
                                    TableCellVerticalAlignment.top,
                                child: Container(
                                  height: 64,
                                  color: AppColors.colorTable0,
                                  child: Center(
                                      child: (controller
                                                  .liquidationShortFuture !=
                                              null)
                                          ? Text(
                                              "${(controller.liquidationShortFuture! * 100).toStringAsFixed(controller.stringAsFixed)}%")
                                          : const SizedBox()),
                                ),
                              ),
                              TableCell(
                                verticalAlignment:
                                    TableCellVerticalAlignment.top,
                                child: Container(
                                  height: 64,
                                  color: AppColors.colorTable0,
                                  child: Center(
                                      child: (controller
                                                  .liquidationShortFuture !=
                                              null)
                                          ? Text(
                                              "${(controller.liquidationShortSport! * 100).toStringAsFixed(controller.stringAsFixed)}%",
                                              style: styleWarning)
                                          : const SizedBox()),
                                ),
                              ),
                              TableCell(
                                verticalAlignment:
                                    TableCellVerticalAlignment.top,
                                child: Container(
                                  height: 64,
                                  color: AppColors.colorTable0,
                                  child: Center(
                                      child: (controller
                                                  .liquidationShortPrice !=
                                              null)
                                          ? Text(
                                              "${(controller.liquidationShortPrice!).toStringAsFixed(controller.stringAsFixedPrice)}")
                                          : const SizedBox()),
                                ),
                              ),
                            ],
                          ),
                          TableRow(
                            // decoration: const BoxDecoration(
                            //   color: Colors.grey,
                            // ),
                            children: <Widget>[
                              TableCell(
                                verticalAlignment:
                                    TableCellVerticalAlignment.top,
                                child: Container(
                                  height: 64,
                                  color: AppColors.colorTable0,
                                  child: Center(child: Text("Stop lost")),
                                ),
                              ),
                              TableCell(
                                verticalAlignment:
                                    TableCellVerticalAlignment.top,
                                child: Container(
                                  height: 64,
                                  color: AppColors.colorTable0,
                                  child: Center(
                                      child: (controller.stopLostShortFuture !=
                                              null)
                                          ? Text(
                                              "${(controller.stopLostShortFuture! * 100).toStringAsFixed(controller.stringAsFixed)}%")
                                          : const SizedBox()),
                                ),
                              ),
                              TableCell(
                                verticalAlignment:
                                    TableCellVerticalAlignment.top,
                                child: Container(
                                  height: 64,
                                  color: AppColors.colorTable0,
                                  child: Center(
                                      child: (controller.stopLostShortSport !=
                                              null)
                                          ? Text(
                                              "${(controller.stopLostShortSport! * 100).toStringAsFixed(controller.stringAsFixed)}%",
                                              style: controller
                                                          .stopLostShortSport! >
                                                      0.04
                                                  ? styleWarning
                                                  : null)
                                          : const SizedBox()),
                                ),
                              ),
                              TableCell(
                                verticalAlignment:
                                    TableCellVerticalAlignment.top,
                                child: Container(
                                  height: 64,
                                  color: AppColors.colorTable0,
                                  child: Center(
                                      child: (controller.stopLostShortPrice !=
                                              null)
                                          ? GestureDetector(
                                          onTap: () {
                                            Clipboard.setData(ClipboardData(
                                                text:
                                                "${(controller.stopLostShortPrice!).toStringAsFixed(controller.stringAsFixedPrice)}"));
                                            HapticFeedback.mediumImpact();
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(SnackBar(
                                              content: Text(
                                                  "Copied: ${(controller.stopLostShortPrice!).toStringAsFixed(controller.stringAsFixedPrice)}"),
                                            ));
                                          },
                                          child:Text(
                                              "${(controller.stopLostShortPrice!).toStringAsFixed(controller.stringAsFixedPrice)}"))
                                          : const SizedBox()),
                                ),
                              ),
                            ],
                          ),
                          TableRow(
                            // decoration: const BoxDecoration(
                            //   color: Colors.grey,
                            // ),
                            children: <Widget>[
                              TableCell(
                                verticalAlignment:
                                    TableCellVerticalAlignment.top,
                                child: Container(
                                  height: 64,
                                  color: AppColors.colorTable0,
                                  child: Center(child: Text("Lãi chờ")),
                                ),
                              ),
                              TableCell(
                                verticalAlignment:
                                    TableCellVerticalAlignment.top,
                                child: Container(
                                  height: 64,
                                  color: AppColors.colorTable0,
                                  child: Center(
                                      child: (controller.waitingShortFuture !=
                                              null)
                                          ? Text(
                                              "${(controller.waitingShortFuture! * 100).toStringAsFixed(controller.stringAsFixed)}%")
                                          : const SizedBox()),
                                ),
                              ),
                              TableCell(
                                verticalAlignment:
                                    TableCellVerticalAlignment.top,
                                child: Container(
                                  height: 64,
                                  color: AppColors.colorTable0,
                                  child: Center(
                                      child:
                                          (controller.waitingShortSport != null)
                                              ? Text(
                                                  "${(controller.waitingShortSport!).toStringAsFixed(controller.stringAsFixed)}%",
                                                  style: styleSuccess,
                                                )
                                              : const SizedBox()),
                                ),
                              ),
                              TableCell(
                                verticalAlignment:
                                    TableCellVerticalAlignment.top,
                                child: Container(
                                  height: 64,
                                  color: AppColors.colorTable0,
                                  child: Center(
                                      child: (controller.waitingShortPrice !=
                                              null)
                                          ? GestureDetector(
                                          onTap: () {
                                            Clipboard.setData(ClipboardData(
                                                text:
                                                "${(controller.waitingShortPrice!).toStringAsFixed(controller.stringAsFixedPrice)}"));
                                            HapticFeedback.mediumImpact();
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(SnackBar(
                                              content: Text(
                                                  "Copied: ${(controller.waitingShortPrice!).toStringAsFixed(controller.stringAsFixedPrice)}"),
                                            ));
                                          },
                                          child: Text(
                                              "${(controller.waitingShortPrice!).toStringAsFixed(controller.stringAsFixedPrice)}"))
                                          : const SizedBox()),
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    : Table(
                        border: TableBorder.all(
                            color: controller.isShort
                                ? AppColors.colorTable3
                                : AppColors.colorTable4),
                        columnWidths: const <int, TableColumnWidth>{
                          0: FixedColumnWidth(81),
                        },
                        defaultVerticalAlignment:
                            TableCellVerticalAlignment.middle,
                        children: <TableRow>[
                          TableRow(
                            children: <Widget>[
                              TableCell(
                                verticalAlignment:
                                    TableCellVerticalAlignment.top,
                                child: Container(
                                  height: 64,
                                  color: AppColors.colorTable0,
                                ),
                              ),
                              TableCell(
                                verticalAlignment:
                                    TableCellVerticalAlignment.top,
                                child: Container(
                                  height: 64,
                                  color: AppColors.colorTable0,
                                  child: Center(child: Text("%Future")),
                                ),
                              ),
                              TableCell(
                                verticalAlignment:
                                    TableCellVerticalAlignment.top,
                                child: Container(
                                  height: 64,
                                  color: AppColors.colorTable0,
                                  child: Center(child: Text("%Sport")),
                                ),
                              ),
                              TableCell(
                                verticalAlignment:
                                    TableCellVerticalAlignment.top,
                                child: Container(
                                  height: 64,
                                  color: AppColors.colorTable0,
                                  child: Center(child: Text("Giá")),
                                ),
                              ),
                            ],
                          ),
                          TableRow(
                            // decoration: const BoxDecoration(
                            //   color: Colors.grey,
                            // ),
                            children: <Widget>[
                              TableCell(
                                verticalAlignment:
                                    TableCellVerticalAlignment.top,
                                child: Container(
                                  height: 64,
                                  color: AppColors.colorTable0,
                                  child: Center(child: Text("Lãi chờ")),
                                ),
                              ),
                              TableCell(
                                verticalAlignment:
                                    TableCellVerticalAlignment.top,
                                child: Container(
                                  height: 64,
                                  color: AppColors.colorTable0,
                                  child: Center(
                                      child: (controller.waitingLongFuture !=
                                              null)
                                          ? Text(
                                              "${(controller.waitingLongFuture! * 100).toStringAsFixed(controller.stringAsFixed)}%")
                                          : const SizedBox()),
                                ),
                              ),
                              TableCell(
                                verticalAlignment:
                                    TableCellVerticalAlignment.top,
                                child: Container(
                                  height: 64,
                                  color: AppColors.colorTable0,
                                  child: Center(
                                      child: (controller.waitingLongSport !=
                                              null)
                                          ? Text(
                                              "${(controller.waitingLongSport!).toStringAsFixed(controller.stringAsFixed)}%",
                                              style: styleSuccess)
                                          : const SizedBox()),
                                ),
                              ),
                              TableCell(
                                verticalAlignment:
                                    TableCellVerticalAlignment.top,
                                child: Container(
                                  height: 64,
                                  color: AppColors.colorTable0,
                                  child: Center(
                                    child: (controller.waitingLongPrice != null)
                                        ? GestureDetector(
                                        onTap: () {
                                          Clipboard.setData(ClipboardData(
                                              text:
                                              "${(controller.stopLostLongPrice!).toStringAsFixed(controller.stringAsFixedPrice)}"));
                                          HapticFeedback.mediumImpact();
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                            content: Text(
                                                "Copied: ${(controller.waitingLongPrice!).toStringAsFixed(controller.stringAsFixedPrice)}"),
                                          ));
                                        },
                                        child:Text(
                                            "${(controller.waitingLongPrice!).toStringAsFixed(controller.stringAsFixedPrice)}"))
                                        : const SizedBox(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          TableRow(
                            // decoration: const BoxDecoration(
                            //   color: Colors.grey,
                            // ),
                            children: <Widget>[
                              TableCell(
                                verticalAlignment:
                                    TableCellVerticalAlignment.top,
                                child: Container(
                                  height: 64,
                                  color: AppColors.colorTable0,
                                  child: Center(child: Text("Stop lost")),
                                ),
                              ),
                              TableCell(
                                verticalAlignment:
                                    TableCellVerticalAlignment.top,
                                child: Container(
                                  height: 64,
                                  color: AppColors.colorTable0,
                                  child: Center(
                                      child: (controller.stopLostLongFuture !=
                                              null)
                                          ? Text(
                                              "${(controller.stopLostLongFuture! * 100).toStringAsFixed(controller.stringAsFixed)}%")
                                          : const SizedBox()),
                                ),
                              ),
                              TableCell(
                                verticalAlignment:
                                    TableCellVerticalAlignment.top,
                                child: Container(
                                  height: 64,
                                  color: AppColors.colorTable0,
                                  child: Center(
                                      child: (controller.stopLostLongSport !=
                                              null)
                                          ? Text(
                                              "${(controller.stopLostLongSport! * 100).toStringAsFixed(controller.stringAsFixed)}%",
                                              style: controller
                                                          .stopLostShortSport! >
                                                      0.04
                                                  ? styleWarning
                                                  : null)
                                          : const SizedBox()),
                                ),
                              ),
                              TableCell(
                                verticalAlignment:
                                    TableCellVerticalAlignment.top,
                                child: Container(
                                  height: 64,
                                  color: AppColors.colorTable0,
                                  child: Center(
                                      child: (controller.stopLostLongPrice !=
                                              null)
                                          ? GestureDetector(
                                              onTap: () {
                                                Clipboard.setData(ClipboardData(
                                                    text:
                                                        "${(controller.stopLostLongPrice!).toStringAsFixed(controller.stringAsFixedPrice)}"));
                                                HapticFeedback.mediumImpact();
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(SnackBar(
                                                  content: Text(
                                                      "Copied: ${(controller.stopLostLongPrice!).toStringAsFixed(controller.stringAsFixedPrice)}"),
                                                ));
                                              },
                                              child: Text(
                                                  "${(controller.stopLostLongPrice!).toStringAsFixed(controller.stringAsFixedPrice)}"))
                                          : const SizedBox()),
                                ),
                              ),
                            ],
                          ),
                          TableRow(
                            // decoration: const BoxDecoration(
                            //   color: Colors.grey,
                            // ),
                            children: <Widget>[
                              TableCell(
                                verticalAlignment:
                                    TableCellVerticalAlignment.top,
                                child: Container(
                                  height: 64,
                                  color: AppColors.colorTable0,
                                  child: Center(child: Text("Giá thanh lý")),
                                ),
                              ),
                              TableCell(
                                verticalAlignment:
                                    TableCellVerticalAlignment.top,
                                child: Container(
                                  height: 64,
                                  color: AppColors.colorTable0,
                                  child: Center(
                                      child: (controller
                                                  .liquidationLongFuture !=
                                              null)
                                          ? Text(
                                              "${(controller.liquidationLongFuture! * 100).toStringAsFixed(controller.stringAsFixed)}%")
                                          : const SizedBox()),
                                ),
                              ),
                              TableCell(
                                verticalAlignment:
                                    TableCellVerticalAlignment.top,
                                child: Container(
                                  height: 64,
                                  color: AppColors.colorTable0,
                                  child: Center(
                                      child:
                                          (controller.liquidationLongFuture !=
                                                  null)
                                              ? Text(
                                                  "${(controller.liquidationLongSport! * 100).toStringAsFixed(controller.stringAsFixed)}%",
                                                  style: styleWarning,
                                                )
                                              : const SizedBox()),
                                ),
                              ),
                              TableCell(
                                verticalAlignment:
                                    TableCellVerticalAlignment.top,
                                child: Container(
                                  height: 64,
                                  color: AppColors.colorTable0,
                                  child: Center(
                                      child: (controller.liquidationLongPrice !=
                                              null)
                                          ? Text(
                                              "${(controller.liquidationLongPrice!).toStringAsFixed(controller.stringAsFixedPrice)}")
                                          : const SizedBox()),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                SizedBox(
                  height: 50,
                ),
                Table(
                  border: TableBorder.all(
                      color: controller.isShort
                          ? AppColors.colorTable3
                          : AppColors.colorTable4),
                  columnWidths: const <int, TableColumnWidth>{
                    0: FixedColumnWidth(81),
                  },
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  children: <TableRow>[
                    TableRow(
                      children: <Widget>[
                        TableCell(
                          verticalAlignment: TableCellVerticalAlignment.middle,
                          child: Container(
                            height: 64,
                            color: AppColors.colorTable0,
                          ),
                        ),
                        TableCell(
                          verticalAlignment: TableCellVerticalAlignment.middle,
                          child: GestureDetector(
                            onTap: () => controller.selection(true),
                            child: Container(
                              height: 64,
                              color: controller.isShort
                                  ? AppColors.colorTable1
                                  : AppColors.colorTable0,
                              child: Center(child: Text("SHORT")),
                            ),
                          ),
                        ),
                        TableCell(
                          verticalAlignment: TableCellVerticalAlignment.middle,
                          child: GestureDetector(
                            onTap: () => controller.selection(false),
                            child: Container(
                              height: 64,
                              color: !controller.isShort
                                  ? AppColors.colorTable2
                                  : AppColors.colorTable0,
                              child: Center(child: Text("LONG")),
                            ),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      // decoration: const BoxDecoration(
                      //   color: Colors.grey,
                      // ),
                      children: <Widget>[
                        TableCell(
                          verticalAlignment: TableCellVerticalAlignment.middle,
                          child: Container(
                            height: 64,
                            color: AppColors.colorTable0,
                            child: Center(child: Text("Giá đáy")),
                          ),
                        ),
                        TableCell(
                          verticalAlignment: TableCellVerticalAlignment.middle,
                          child: Container(
                            height: 64,
                            color: AppColors.colorTable0,
                            child: Center(
                                child: TextField2(
                              tag: "bottomShort",
                              unit: 'BTC',
                              value: controller.bottomShort != null
                                  ? controller.bottomShort.toString()
                                  : null,
                              onChanged: controller.changeBottomShort,
                            )),
                          ),
                        ),
                        TableCell(
                          verticalAlignment: TableCellVerticalAlignment.middle,
                          child: Container(
                            height: 64,
                            color: AppColors.colorTable0,
                            child: Center(
                                child: TextField2(
                              tag: "bottomLong",
                              unit: 'BTC',
                              value: controller.bottomLong != null
                                  ? controller.bottomLong.toString()
                                  : null,
                              onChanged: controller.changeBottomLong,
                            )),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      // decoration: const BoxDecoration(
                      //   color: Colors.grey,
                      // ),
                      children: <Widget>[
                        TableCell(
                          verticalAlignment: TableCellVerticalAlignment.middle,
                          child: Container(
                            height: 64,
                            color: AppColors.colorTable0,
                            child: Center(child: Text("Đòn bẩy")),
                          ),
                        ),
                        TableCell(
                          verticalAlignment: TableCellVerticalAlignment.middle,
                          child: Container(
                            height: 64,
                            color: AppColors.colorTable0,
                            child: Center(
                                child: TextField2(
                              tag: "leverShort",
                              unit: 'Lever',
                              value: controller.leverShort != null
                                  ? controller.leverShort.toString()
                                  : null,
                              onChanged: controller.changeLeverShort,
                            )),
                          ),
                        ),
                        TableCell(
                          verticalAlignment: TableCellVerticalAlignment.middle,
                          child: Container(
                            height: 64,
                            color: AppColors.colorTable0,
                            child: Center(
                                child: TextField2(
                              tag: "leverLong",
                              unit: 'Lever',
                              value: controller.leverLong != null
                                  ? controller.leverLong.toString()
                                  : null,
                              onChanged: controller.changeLeverLong,
                            )),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      // decoration: const BoxDecoration(
                      //   color: Colors.grey,
                      // ),
                      children: <Widget>[
                        TableCell(
                          verticalAlignment: TableCellVerticalAlignment.middle,
                          child: Container(
                            height: 64,
                            color: AppColors.colorTable0,
                            child: Center(child: Text("Giá mua")),
                          ),
                        ),
                        TableCell(
                          verticalAlignment: TableCellVerticalAlignment.middle,
                          child: Container(
                            height: 64,
                            color: AppColors.colorTable0,
                            child: Center(
                                child: TextField2(
                              tag: "buyShort",
                              unit: 'BTC',
                              value: controller.buyShort != null
                                  ? controller.buyShort.toString()
                                  : null,
                              onChanged: controller.changeBuyShort,
                            )),
                          ),
                        ),
                        TableCell(
                          verticalAlignment: TableCellVerticalAlignment.middle,
                          child: Container(
                            height: 64,
                            color: AppColors.colorTable0,
                            child: Center(
                                child: TextField2(
                              tag: "buyLong",
                              unit: 'BTC',
                              value: controller.buyLong != null
                                  ? controller.buyLong.toString()
                                  : null,
                              onChanged: controller.changeBuyLong,
                            )),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      // decoration: const BoxDecoration(
                      //   color: Colors.grey,
                      // ),
                      children: <Widget>[
                        TableCell(
                          verticalAlignment: TableCellVerticalAlignment.middle,
                          child: Container(
                            height: 64,
                            color: AppColors.colorTable0,
                            child: Center(child: Text("% Lãi")),
                          ),
                        ),
                        TableCell(
                          verticalAlignment: TableCellVerticalAlignment.middle,
                          child: Container(
                            height: 64,
                            color: AppColors.colorTable0,
                            child: Center(
                                child: TextField2(
                              tag: "interestShort",
                              unit: '%',
                              value: controller.interestShort != null
                                  ? controller.interestShort.toString()
                                  : null,
                              onChanged: controller.changeInterestShort,
                            )),
                          ),
                        ),
                        TableCell(
                          verticalAlignment: TableCellVerticalAlignment.middle,
                          child: Container(
                            height: 64,
                            color: AppColors.colorTable0,
                            child: Center(
                                child: TextField2(
                              tag: "interestLong",
                              unit: '%',
                              value: controller.interestLong != null
                                  ? controller.interestLong.toString()
                                  : null,
                              onChanged: controller.changeInterestLong,
                            )),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      // decoration: const BoxDecoration(
                      //   color: Colors.grey,
                      // ),
                      children: <Widget>[
                        TableCell(
                          verticalAlignment: TableCellVerticalAlignment.middle,
                          child: Container(
                            height: 64,
                            color: AppColors.colorTable0,
                            child: Center(child: Text("Tiền đầu tư")),
                          ),
                        ),
                        TableCell(
                          verticalAlignment: TableCellVerticalAlignment.middle,
                          child: Container(
                            height: 64,
                            color: AppColors.colorTable0,
                            child: Center(
                                child: TextField2(
                              tag: "inUSDShort",
                              unit: '\$',
                              value: controller.inUSDShort != null
                                  ? controller.inUSDShort.toString()
                                  : null,
                              onChanged: controller.changeInUSDShort,
                            )),
                          ),
                        ),
                        TableCell(
                          verticalAlignment: TableCellVerticalAlignment.middle,
                          child: Container(
                            height: 64,
                            color: AppColors.colorTable0,
                            child: Center(
                                child: TextField2(
                              tag: "inUSDLong",
                              unit: '\$',
                              value: controller.inUSDLong != null
                                  ? controller.inUSDLong.toString()
                                  : null,
                              onChanged: controller.changeInUSDLong,
                            )),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      // decoration: const BoxDecoration(
                      //   color: Colors.grey,
                      // ),
                      children: <Widget>[
                        TableCell(
                          verticalAlignment: TableCellVerticalAlignment.middle,
                          child: Container(
                            height: 64,
                            color: AppColors.colorTable0,
                            child: Center(child: Text("Tiền lỗ")),
                          ),
                        ),
                        TableCell(
                          verticalAlignment: TableCellVerticalAlignment.middle,
                          child: Container(
                            height: 64,
                            color: AppColors.colorTable0,
                            child: Center(
                                child: (controller.lostUSDShort != null)
                                    ? Text(
                                        "${(controller.lostUSDShort!).toStringAsFixed(controller.stringAsFixed)}",
                                        style: controller.lostUSDShort! >
                                                controller.inUSDShort!
                                            ? styleWarning
                                            : null,
                                      )
                                    : const SizedBox()),
                          ),
                        ),
                        TableCell(
                          verticalAlignment: TableCellVerticalAlignment.middle,
                          child: Container(
                            height: 64,
                            color: AppColors.colorTable0,
                            child: Center(
                                child: (controller.lostUSDLong != null)
                                    ? Text(
                                        "${(controller.lostUSDLong!).toStringAsFixed(controller.stringAsFixed)}",
                                        style: controller.lostUSDLong! >
                                                controller.inUSDLong!
                                            ? styleWarning
                                            : null,
                                      )
                                    : const SizedBox()),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      // decoration: const BoxDecoration(
                      //   color: Colors.grey,
                      // ),
                      children: <Widget>[
                        TableCell(
                          verticalAlignment: TableCellVerticalAlignment.middle,
                          child: Container(
                            height: 64,
                            color: AppColors.colorTable0,
                            child: Center(child: Text("% Maker")),
                          ),
                        ),
                        TableCell(
                          verticalAlignment: TableCellVerticalAlignment.middle,
                          child: GestureDetector(
                            onTap: () => controller.shortMaker(true),
                            child: Container(
                              height: 64,
                              color: controller.isShortMaker
                                  ? AppColors.colorTable1
                                  : AppColors.colorTable0,
                              child: Center(
                                  child: Text(
                                      "${(controller.maker * 100).toStringAsFixed(controller.stringAsFixed)}%")),
                            ),
                          ),
                        ),
                        TableCell(
                          verticalAlignment: TableCellVerticalAlignment.middle,
                          child: GestureDetector(
                            onTap: () => controller.longMaker(true),
                            child: Container(
                              height: 64,
                              color: controller.isLongMaker
                                  ? AppColors.colorTable2
                                  : AppColors.colorTable0,
                              child: Center(
                                  child: Text(
                                      "${(controller.maker * 100).toStringAsFixed(controller.stringAsFixed)}%")),
                            ),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      // decoration: const BoxDecoration(
                      //   color: Colors.grey,
                      // ),
                      children: <Widget>[
                        TableCell(
                          verticalAlignment: TableCellVerticalAlignment.middle,
                          child: Container(
                            height: 64,
                            color: AppColors.colorTable0,
                            child: Center(child: Text("%Taker")),
                          ),
                        ),
                        TableCell(
                          verticalAlignment: TableCellVerticalAlignment.middle,
                          child: GestureDetector(
                            onTap: () => controller.shortMaker(false),
                            child: Container(
                              height: 64,
                              color: !controller.isShortMaker
                                  ? AppColors.colorTable1
                                  : AppColors.colorTable0,
                              child: Center(
                                  child: Text(
                                      "${(controller.taker * 100).toStringAsFixed(controller.stringAsFixed)}%")),
                            ),
                          ),
                        ),
                        TableCell(
                          verticalAlignment: TableCellVerticalAlignment.middle,
                          child: GestureDetector(
                            onTap: () => controller.longMaker(false),
                            child: Container(
                              height: 64,
                              color: !controller.isLongMaker
                                  ? AppColors.colorTable2
                                  : AppColors.colorTable0,
                              child: Center(
                                  child: Text(
                                      "${(controller.taker * 100).toStringAsFixed(controller.stringAsFixed)}%")),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: context.height * 0.1,
                )
              ],
            ),
          ));
    });
  }
}
