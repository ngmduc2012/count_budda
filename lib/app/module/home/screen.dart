import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:nam_mo_a_di_da_phat/app/module/home/widgets/buttons.dart';

import '../../../core/values/text_style.dart';
import '../../widgets/menu_drawer.dart';
import 'controller.dart';

class HomeScreen extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        builder: (controller) => Scaffold(
              appBar: AppBar(
                title: ListTile(
                    title: const Text(
                      "ngmduc2012",
                      style: styleTitle,
                      textAlign: TextAlign.center,
                    ),

                    ///Create number on icon notification,the following: https://stackoverflow.com/a/63968272/10621168
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        SizedBox(),
                      ],
                    )),
                flexibleSpace: const Image(
                  image: AssetImage("assets/images/bg_appbar.png"),
                  fit: BoxFit.cover,
                ),
                actions: [
                  GestureDetector(
                    onTap: () {
                      HapticFeedback.mediumImpact();
                      ScaffoldMessenger.of(context)
                          .showSnackBar(const SnackBar(
                        content: Text(
                            "Nếu niệm Phật không có tác dụng thì niệm: NA TA SE RA"),
                      ));
                    },
                    child: const Icon(
                      Icons.lock,
                      color: Colors.red,
                    ),
                  ),
                  const SizedBox(
                    width: 18,
                  ),
                  GestureDetector(
                    onTap: () {
                      controller.myController.clear();
                      controller.saveData();
                    },
                    child: const Icon(
                      Icons.verified,
                      color: Colors.green,
                    ),
                  ),
                  const SizedBox(
                    width: 24,
                  )
                ],
              ),
              drawer: MenuDrawer(),
              body: RefreshIndicator(
                onRefresh: _pullRefresh,
                child:
                    // SingleChildScrollView(
                    //   // controller: controller.scrollControllerHome,
                    //   // physics: BouncingScrollPhysics(
                    //   //     parent: AlwaysScrollableScrollPhysics()),
                    //   child:
                    Padding(
                  padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                  child: ListView(
                    controller: controller.scrollControllerHome,
                    physics: const BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics()),

                    /// Bug: Vertical viewport was given unbounded height
                    /// The following: https://stackoverflow.com/a/54587532/10621168
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    children: [
                      SizedBox(
                        height: 72,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Clipboard.setData(
                                  ClipboardData(text: "${controller.counter}"));
                              HapticFeedback.mediumImpact();
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text("Copied: ${controller.counter}"),
                              ));
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '${controller.counter}',
                                  style: const TextStyle(fontSize: 26),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: const [
                                    SizedBox(
                                      height: 12,
                                    ),
                                    Text(
                                      '/10000',
                                      style: TextStyle(fontSize: 13),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Clipboard.setData(ClipboardData(
                                  text: "${controller.a_di_da_phat}"));
                              HapticFeedback.mediumImpact();
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text("Copied: ${controller.a_di_da_phat} "),
                              ));
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '${controller.a_di_da_phat}',
                                  style: const TextStyle(fontSize: 13),
                                ),
                              ],
                            ),
                          ),
                          const Text(
                            'Nam Mô A Di Đà Phật',
                          ),
                          GestureDetector(
                            onTap: () {
                              // Clipboard.setData(ClipboardData(text: "${((_lastWords.length - _lastWords.replaceAll("A Di Đà", "").length) / ("A Di Đà".length)).round()}"));
                              // HapticFeedback.mediumImpact();
                              // _messangerKey.currentState!.showSnackBar(SnackBar(
                              //   content: Text("Copied: ${((_lastWords.length - _lastWords.replaceAll("A Di Đà", "").length) / ("A Di Đà".length)).round()} "),
                              // ));
                              controller.getVoice();
                            },
                            child: Text(
                              // If listening is active show the recognized words
                              controller.speechToText.isListening
                                  ? controller.lastWords
                                  // If listening isn't active but could be tell the user
                                  // how to start it, otherwise indicate that speech
                                  // recognition is not yet ready or not supported on
                                  // the target device
                                  : controller.speechEnabled
                                      ? ''
                                      : 'Speech not available',
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 72,
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () => controller.incrementCounter(1),
                            child:  ElevatedCard(
                              width: context.width*0.7,
                              height: context.height*0.1,
                              color: Colors.red,
                              text: "1",
                              colorText: Colors.white,
                            ),
                          ),
                          GestureDetector(
                            onTap: () => controller.incrementCounter(-1),
                            child:  ElevatedCard(
                              width: context.width*0.2,
                              height: context.height*0.1,
                              color: Colors.red,
                              text: "-1",
                              colorText: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () => controller.incrementCounter(5),
                            child:  ElevatedCard(
                              width: context.width*0.7,
                              height: context.height*0.1,
                              color: Colors.yellow,
                              text: "+5",
                              colorText: Colors.black,
                            ),
                          ),
                          GestureDetector(
                            onTap: () => controller.incrementCounter(-5),
                            child:  ElevatedCard(
                              width: context.width*0.2,
                              height: context.height*0.1,
                              color: Colors.yellow,
                              text: "-5",
                              colorText: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () => controller.incrementCounter(10),
                            child: ElevatedCard(
                              width: context.width*0.7,
                              height: context.height*0.1,
                              color: Colors.green,
                              text: "+10",
                              colorText: Colors.white,
                            ),
                          ),
                          GestureDetector(
                            onTap: () => controller.incrementCounter(-10),
                            child: ElevatedCard(
                              width: context.width*0.2,
                              height: context.height*0.1,
                              color: Colors.green,
                              text: "-10",
                              colorText: Colors.white,
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(
                            width: 4,
                          ),
                          Flexible(
                            child: TextField(
                              controller: controller.myController,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Enter a number',
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: Stack(
                              children: <Widget>[
                                Positioned.fill(
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: <Color>[
                                          Colors.blue,
                                          Colors.blue
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                TextButton(
                                  style: TextButton.styleFrom(
                                    padding: const EdgeInsets.all(16.0),
                                    primary: Colors.white,
                                    textStyle: const TextStyle(fontSize: 20),
                                  ),
                                  onPressed: () {
                                    controller.incrementCounter(
                                        int.parse(controller.myController.value.text));
                                  },
                                  child: const Text("+"),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: Stack(
                              children: <Widget>[
                                Positioned.fill(
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: <Color>[
                                          Colors.blueGrey,
                                          Colors.blueGrey
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                TextButton(
                                  style: TextButton.styleFrom(
                                    padding: const EdgeInsets.all(16.0),
                                    primary: Colors.white,
                                    textStyle: const TextStyle(fontSize: 20),
                                  ),
                                  onPressed: () {
                                    controller.incrementCounter(
                                        -int.parse(controller.myController.value.text));
                                  },
                                  child: Text("-"),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 4,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 108,
                      ),
                    ],
                  ),
                ),
                // ),
              ),
              floatingActionButton: FloatingActionButton(
                backgroundColor: Colors.blue,
                onPressed:
                    // If not yet listening for speech start, otherwise stop
                    controller.speechToText.isNotListening
                        ? controller.startListening
                        : controller.stopListening,
                tooltip: 'Listen',
                child: controller.speechToText.isNotListening
                    ? const Icon(
                        Icons.mic,
                        color: Colors.white,
                      )
                    : Text(
                        "${controller.numberADiDaVoice}",
                        style:
                            const TextStyle(fontSize: 36, color: Colors.white),
                      ),
              ),
            ));
  }

  Future<void> _pullRefresh() async {}
}
