import 'dart:ui';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../common/storage_key.dart';
import 'lang_manager.dart';

class LangManagerImpl implements LangManager {
  final GetStorage _storage = GetStorage();

  @override
  Rx<LangType> langType = LangType.en.obs;

  @override
  String get lang {
    switch (langType.value) {
      case LangType.en:
        return 'en_US';
      case LangType.zh:
        return 'zh_CN';
      default:
        return 'zh_CN';
    }
  }

  @override
  Locale get locale {
    return Locale(langType.value.name);
  }

  @override
  onInit() async {
    var lang = _storage.read<String>(StorageKey.lang);
    if (lang == null) {
      // 获取系统语言
      Locale? locale = Get.deviceLocale;
      if (locale?.languageCode == LangType.zh.name) {
        langType.value = LangType.zh;
        await _storage.write(StorageKey.lang, langType.value.name);
      }
    } else {
      langType.value = getLangTypeByName(lang);
    }
  }

  LangType getLangTypeByName(String name) {
    return LangType.values.firstWhere(
      (langType) {
        return langType.name == name;
      },
      orElse: () => LangType.zh,
    );
  }

  @override
  changeLang(String value) {
    langType.value = getLangTypeByName(value);
    _storage.write(StorageKey.lang, langType.value.name);
    Locale selectLang = Locale(value);
    Get.updateLocale(selectLang);
  }
}
