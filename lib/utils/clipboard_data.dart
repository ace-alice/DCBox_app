import 'package:flutter/services.dart';

import '../common/app_toast.dart';

void clipboardData(String text) {
  Clipboard.setData(ClipboardData(text: text)).then((value) {
    AppToast.simple("复制成功", ToastType.success);
  }, onError: (err) {
    AppToast.simple("复制失败，请重新复制", ToastType.fail);
  });
}
