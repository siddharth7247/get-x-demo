import 'package:get/get_navigation/src/root/internacionalization.dart';
import 'package:getx_demo/localization/ar_ae_translations.dart';
import 'package:getx_demo/localization/en_us_translations.dart';
import 'package:getx_demo/localization/hi_in_translations.dart';

class AppLocalization extends Translations{
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': enUs,
        'ar_AE': arAe,
        'hi_IN': hiIn,
      };
}