import 'package:get/get.dart';

import '../lang_manager.dart';
import 'en.dart';
import 'zh.dart';

class Messages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        LangType.en.name: en,
        LangType.en.name: zh,
      };
}
