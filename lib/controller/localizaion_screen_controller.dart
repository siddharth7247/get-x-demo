import 'dart:ui';
import 'package:get/get.dart';

class LocalizaionScreenController  extends GetxController{
  void changeLanguage(String langCode, String countryCode) {
    var locale = Locale(langCode, countryCode); 
    Get.updateLocale(locale); 
  }
}