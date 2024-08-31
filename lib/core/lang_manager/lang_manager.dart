import 'dart:ui';

abstract class LangManager {
  void onInit();

  String get lang;

  Locale get locale;
}

enum LangType {
  en,
  zh,
}
