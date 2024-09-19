import 'dart:ui';

import 'package:dc_box_app/common/app_logger.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../common/storage_key.dart';
import 'lang_manager.dart';

class LangManagerImpl implements LangManager {
  final GetStorage _storage = GetStorage();

  LangType _lang = LangType.en;

  @override
  String get lang {
    switch (_lang) {
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
    return Locale(_lang.name);
  }

  @override
  onInit() async {
    var lang = _storage.read<String>(StorageKey.lang);
    if (lang == null) {
      // 获取系统语言
      Locale? locale = Get.deviceLocale;
      if (locale?.languageCode == LangType.zh.name) {
        _lang = LangType.zh;
        await _storage.write(StorageKey.lang, _lang.name);
      }
    } else {
      if (lang == LangType.en.name) {
        _lang = LangType.en;
      }
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
    Locale selectLang = Locale(value);
    Get.updateLocale(selectLang);
    logger.w('changeLang=>$value');
  }
}
