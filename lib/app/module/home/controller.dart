import 'dart:async';
import 'dart:math';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'dart:developer' as d;

import '../../../main.dart';
import '../../data/services/localization.dart';

class HomeController extends FullLifeCycleController {
  ///Call HomeController in other model
  static HomeController get to => Get.find();

  String updateErrorMessage = "";

  ///Initial Scroll for SingleChildScrollView, follow: https://stackoverflow.com/a/56220250/10621168
  final ScrollController scrollControllerHome = ScrollController(
    initialScrollOffset: 0.0,
    keepScrollOffset: true,
  );

  final messangerKey = GlobalKey<ScaffoldMessengerState>();
  /// Tính số lần niệm Phật
  int counter = 0;
  int a_di_da_phat = 0;

  void incrementCounter(int number) {
    if (number > 0) {
      HapticFeedback.mediumImpact();
    }
      if (counter + number >= 0) {
        counter += number;
        storage.write(COUNT, counter);
      }
      update();
  }

  final storage = GetStorage();
  final ADIDAPHAT = "ADIDAPHAT";
  final COUNT = "COUNT";

  Future<void> saveData() async {
      a_di_da_phat += counter;
      storage.write(ADIDAPHAT, a_di_da_phat);
      counter = 0;
      storage.write(COUNT, counter);
      update();
  }

  /// Nhận diện giọng nói - Nam Mô A Di Đà Phật
  final SpeechToText speechToText = SpeechToText();
  bool speechEnabled = false;
  String lastWords = '';

  void initSpeech() async {
    speechEnabled = await speechToText.initialize();
    update();
  }

  void startListening() async {
    await speechToText.listen(
      // cancelOnError: false,
      // listenMode: ListenMode.confirmation,
      // listenFor: const Duration(minutes:  10),
      // pauseFor: const Duration(seconds: 10),
      // partialResults: true,
        localeId: 'vi',
        onResult: (val) =>
          check(val.recognizedWords)
        );
    update();
  }

  final VOICE = "VOICE";

  check(String word) {
    if (speechToText.isNotListening) {
      startListening();
    }
    countVoice(word);
    update();
  }

  getVoice() {
    if (speechToText.isListening) {
      stopListening();
    } else {
      countVoice("");
    }
    update();
  }

  var numberADiDaVoice = 0;

  setNumberADiDaVoiec() {
    return ((lastWords.length -
        lastWords
            .replaceAll("A Di Đà", "")
            .replaceAll("a di đà", "")
            .replaceAll("A di đà", "")
            .replaceAll("a Di Đà", "")
            .length) /
        ("A Di Đà".length))
        .round();
  }

  countVoice(String word) {
    var number = setNumberADiDaVoiec();
    // Tính năng rung nhẹ này, để người dùng biết là thiết bị vẫn nhận diện được từ
    // A Di Đà,
    if(number > numberADiDaVoice){
      HapticFeedback.lightImpact();
    }
    numberADiDaVoice = number;
    // Điều kiện 1 để đảm bảo chỉ cộng thêm lần đầu nói.
    // Điều kiện 2 để tránh hệ thống sửa từ gây thỏa mãn điều kiện 1.
    // VD: sử A Di Đà Phật thành nhạc Phật gây thỏa mãn điều kiện 1 khi chưa đang nói, lúc í hệ thống sẽ
    // cộng thêm từ không đúng trường hợp.
    if (lastWords.length > word.length && "A Di Đà".length > word.length) {
      // d.log("word:  ${_lastWords.length}");

      incrementCounter(numberADiDaVoice);
      // d.log("word2:  ${_lastWords.replaceAll("A Di Đà", "").length}");
      d.log("count + ${numberADiDaVoice}");
      // _lastWords = "";

    }
    lastWords = word;

    if (lastWords.length > 45 * "Nam Mô A Di Đà Phật ".length) {
      stopListening();
    }

    storage.write(VOICE, lastWords);
    update();
  }

  void stopListening() async {
    await speechToText.stop();
    update();
  }

  @override
  void onInit() {
    initSpeech();
    a_di_da_phat = storage.read(ADIDAPHAT) ?? 0;
    counter = storage.read(COUNT) ?? 0;
    lastWords = storage.read(VOICE) ?? "";
    numberADiDaVoice = setNumberADiDaVoiec();
    update();
    super.onInit();
  }

  final myController = TextEditingController();

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }



}
