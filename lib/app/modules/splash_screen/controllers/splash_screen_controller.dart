// ignore_for_file: avoid_print, unnecessary_overrides, unrelated_type_equality_checks, prefer_interpolation_to_compose_strings

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monitoring_kalori/app/modules/commons/navigation_drawer/controllers/navigation_drawer_controller.dart';
import 'package:monitoring_kalori/app/routes/app_pages.dart';

import '../../hitung_bmi/controllers/hitung_bmi_controller.dart';
import '../../login/controllers/login_controller.dart';

class SplashScreenController extends GetxController {
  int timer = 3;

  @override
  void onInit() {
    Get.put(NavigationDrawerController(), permanent: true);
    final loginC = Get.put(LoginController());
    final bmiC = Get.put(HitungBmiController());

    super.onInit();
    print("on init");
    if (loginC.isSignIn() == true) {
      print("userdata+ " + loginC.auth.currentUser.toString());
      print(bmiC.isHasBmi());
      if (bmiC.isHasBmi() == true) {
        print("has bmi = " + bmiC.isHasBmi().toString());
        print("Going to Routes Home in " + timer.toString() + " seconds");
        Timer(Duration(seconds: timer), () => {Get.offNamed(Routes.HOME)});
      } else {
        print("has no bmi = " + bmiC.isHasBmi().toString());
        print("Going to Routes hitung bmi in " + timer.toString() + " seconds");
        Timer(
            Duration(seconds: timer), () => {Get.offNamed(Routes.HITUNG_BMI)});
      }
    } else {
      print("has no sign in");
      print("Going to Routes Login in " + timer.toString() + " seconds");
      print("userdata = " + loginC.auth.currentUser.toString());
      Timer(Duration(seconds: timer), () => {Get.offNamed(Routes.LOGIN)});
    }
  }

  @override
  void onReady() {
    super.onReady();
    print("on ready");
  }

  @override
  void onClose() {
    super.onClose();
  }
}
