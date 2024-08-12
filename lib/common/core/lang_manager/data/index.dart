import 'package:dc_box_app/common/core/lang_manager/data/en_us.dart';
import 'package:dc_box_app/common/core/lang_manager/data/zh_cn.dart';
import 'package:dc_box_app/common/core/lang_manager/lang_manager.dart';
import 'package:get/get.dart';

class Messages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        LangType.en.name: enUs,
        LangType.en.name: zhCn,
      };
}
