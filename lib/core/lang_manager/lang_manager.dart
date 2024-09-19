import 'dart:ui';

abstract class LangManager {
  void onInit();

  String get lang;

  Locale get locale;

  void changeLang(String value);
}

enum LangType {
  en,
  zh,
}
