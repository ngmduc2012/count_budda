import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'dart:developer' as d;

import '../../data/services/localization.dart';

class FutureController extends GetxController {
  /// Lấy sau dấu phẩy n số.
  var stringAsFixedPrice = 2;
  var stringAsFixed = 3;

  final IsShort = "IsShort";
  var isShort = true;

  selection(short) {
    isShort = short;
    storage.write(IsShort, isShort);
    update();
  }

  var maker = 0.00012;
  var taker = 0.0003;
  final IsShortMaker = "isShortMaker";
  var isShortMaker = true;

  shortMaker(maker) {
    selection(true);
    isShortMaker = maker;
    storage.write(IsShortMaker, isShortMaker);
    setShort();
    update();
  }

  final IsLongMaker = "IsLongMaker";
  var isLongMaker = true;

  longMaker(maker) {
    selection(false);
    isLongMaker = maker;
    storage.write(IsLongMaker, isLongMaker);
    setLong();
    update();
  }

  /// LOST
  double? lostUSDShort;
  double? lostUSDLong;

  /// IN
  final InUSDShort = "InUSDShort";
  double? inUSDShort;

  void changeInUSDShort(String? inUSDShort) {
    selection(true);
    if (inUSDShort == null || inUSDShort == "") {
      this.inUSDShort = null;
      storage.write(InUSDShort, this.inUSDShort);
    } else {
      try {
        this.inUSDShort = double.parse(inUSDShort);
        storage.write(InUSDShort, this.inUSDShort);
        setShort();
      } catch (e) {}
    }
  }

  final InUSDLong = "InUSDLong";
  double? inUSDLong;

  void changeInUSDLong(String? inUSDLong) {
    selection(false);
    if (inUSDLong == null || inUSDLong == "") {
      this.inUSDLong = null;
      storage.write(InUSDLong, this.inUSDLong);
    } else {
      try {
        this.inUSDLong = double.parse(inUSDLong);
        storage.write(InUSDLong, this.inUSDLong);
        setLong();
      } catch (e) {}
    }
  }

  /// interest - Lãi
  final InterestShort = "InterestShort";
  double? interestShort;

  void changeInterestShort(String? interestShort) {
    selection(true);
    if (interestShort == null || interestShort == "") {
      this.interestShort = null;
      storage.write(InterestShort, this.interestShort);
    } else {
      try {
        this.interestShort = double.parse(interestShort);
        storage.write(InterestShort, this.interestShort);
        setShort();
      } catch (e) {}
    }
  }

  final InterestLong = "InterestLong";
  double? interestLong;

  void changeInterestLong(String? interestLong) {
    selection(false);
    if (interestLong == null  || interestLong == "") {
      this.interestLong = null;
      storage.write(InterestLong, this.interestLong);
    } else {
      try {
        this.interestLong = double.parse(interestLong);
        storage.write(InterestLong, this.interestLong);
        setLong();
      } catch (e) {}
    }
  }

  /// BUY - giá mua
  final BuyShort = "BuyShort";
  double? buyShort;

  void changeBuyShort(String? buyShort) {
    selection(true);
    if (buyShort == null || buyShort == "") {
      this.buyShort = null;
      storage.write(BuyShort, this.buyShort);
    } else {
      try {
        this.buyShort = double.parse(buyShort);
        storage.write(BuyShort, this.buyShort);
        setShort();
      } catch (e) {}
    }
  }

  final BuyLong = "BuyLong";
  double? buyLong;

  void changeBuyLong(String? buyLong) {
    selection(false);
    if (buyLong == null || buyLong == "") {
      this.buyLong = null;
      storage.write(BuyLong, this.buyLong);
    } else {
      try {
        this.buyLong = double.parse(buyLong);
        storage.write(BuyLong, this.buyLong);
        setLong();
      } catch (e) {}
    }
  }

  /// Lever - Đòn bẩy
  final LeverShort = "LeverShort";
  double? leverShort;

  void changeLeverShort(String? leverShort) {
    selection(true);
    if (leverShort == null|| leverShort == "") {
      this.leverShort = null;
      storage.write(LeverShort, this.leverShort);
    } else {
      try {
        this.leverShort = double.parse(leverShort);
        storage.write(LeverShort, this.leverShort);
        setShort();
      } catch (e) {}
    }
  }

  final LeverLong = "LeverLong";
  double? leverLong;

  void changeLeverLong(String? leverLong) {
    selection(false);
    if (leverLong == null || leverLong == "") {
      this.leverLong = null;
      storage.remove(LeverLong);
    } else {
      try {
        this.leverLong = double.parse(leverLong);
        storage.write(LeverLong, this.leverLong);
        setLong();
      } catch (e) {}
    }
  }

  /// bottom - Giá đáy
  final BottomShort = "BottomShort";
  double? bottomShort;

  void changeBottomShort(String? bottomShort) {
    selection(true);
    if (bottomShort == null || bottomShort == "") {
      this.bottomShort = null;
      storage.write(BottomShort, this.bottomShort);
    } else {
      try {
        this.bottomShort = double.parse(bottomShort);
        storage.write(BottomShort, this.bottomShort);
        setShort();
      } catch (e) {}
    }
  }

  final BottomLong = "BottomLong";
  double? bottomLong;

  void changeBottomLong(String? bottomLong) {
    selection(false);
    if (bottomLong == null || bottomLong == "") {
      this.bottomLong = null;
      storage.write(BottomLong, this.bottomLong);
    } else {
      try {
        this.bottomLong = double.parse(bottomLong);
        storage.write(BottomLong, this.bottomLong);
        setLong();
      } catch (e) {}
    }
  }

  /// Tính SHORT
  double? liquidationShortFuture;
  double? liquidationShortSport = 1;
  double? liquidationShortPrice;

  double? stopLostShortFuture;
  double? stopLostShortSport;
  double? stopLostShortPrice;

  double? waitingShortFuture;
  double? waitingShortSport;
  double? waitingShortPrice;

  setShort() {
    if (inUSDShort != null &&
        interestShort != null &&
        buyShort != null &&
        buyShort != 0 &&
        leverShort != null &&
        leverShort != 0 &&
        bottomShort != null) {
      liquidationShortFuture = (liquidationShortSport! / leverShort!);
      liquidationShortPrice = buyShort! * (1 + liquidationShortFuture!);
      stopLostShortFuture = (bottomShort! - buyShort!) / buyShort! +
          (isShortMaker ? maker : taker);
      stopLostShortSport = stopLostShortFuture! * leverShort!;
      stopLostShortPrice = buyShort! * (1 + stopLostShortFuture!);
      waitingShortSport = interestShort! * 0.2;
      waitingShortFuture = waitingShortSport! / leverShort! / 100;
      waitingShortPrice = buyShort! / (1 + waitingShortFuture!);
      lostUSDShort = inUSDShort! * stopLostShortSport!;
    }
    update();
  }

  /// Tính LONG

  double? liquidationLongFuture;
  double? liquidationLongSport = 1;
  double? liquidationLongPrice;

  double? stopLostLongFuture;
  double? stopLostLongSport;
  double? stopLostLongPrice;

  double? waitingLongFuture;
  double? waitingLongSport;
  double? waitingLongPrice;

  setLong() {
    if (inUSDLong != null &&
        interestLong != null &&
        buyLong != null &&
        buyLong != 0 &&
        leverLong != null &&
        leverLong != 0 &&
        bottomLong != null) {
      liquidationLongFuture = (liquidationLongSport! / leverLong!);
      liquidationLongPrice = buyLong! / (1 + liquidationLongFuture!);
      stopLostLongFuture = (-bottomLong! + buyLong!) / bottomLong! +
          (isLongMaker ? maker : taker);
      stopLostLongSport = stopLostLongFuture! * leverLong!;
      stopLostLongPrice = buyLong! / (1 + stopLostLongFuture!);
      waitingLongSport = interestLong! * 0.2;
      waitingLongFuture = waitingLongSport! / leverLong! / 100;
      waitingLongPrice = buyLong! * (1 + waitingLongFuture!);
      lostUSDLong = inUSDLong! * stopLostLongSport!;
    }
    update();
  }

  /// Lưu biến
  final storage = GetStorage();

  @override
  void onInit() {
    super.onInit();
    init();
  }

  init() {
    isShort = storage.read(IsShort) ?? true;
    isShortMaker = storage.read(IsShortMaker) ?? true;
    isLongMaker = storage.read(IsLongMaker) ?? true;

    inUSDShort = storage.read(InUSDShort);
    interestShort = storage.read(InterestShort);
    buyShort = storage.read(BuyShort);
    leverShort = storage.read(LeverShort);
    bottomShort = storage.read(BottomShort);

    inUSDLong = storage.read(InUSDLong);
    interestLong = storage.read(InterestLong);
    buyLong = storage.read(BuyLong);
    leverLong = storage.read(LeverLong);
    bottomLong = storage.read(BottomLong);

    setLong();
    setShort();

    update();
  }
}
