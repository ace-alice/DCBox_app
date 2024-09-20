import 'dart:ui';

import 'package:get/get.dart';

abstract class LangManager {
  late Rx<LangType> langType;

  void onInit();

  String get lang;

  Locale get locale;

  void changeLang(String value);
}

enum LangType {
  en,
  zh,
}
