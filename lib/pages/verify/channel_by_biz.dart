import 'package:dc_box_app/common/biz_types.dart';
import 'package:get/get.dart';

import 'handlers/index.dart';

channelByBiz(BizType bizType, String? token, String securityId) {
  switch (bizType) {
    case BizType.LOGIN:
      LoginHandler loginHandler = Get.find<LoginHandler>();
      loginHandler.init(token, securityId);
      return;
    case BizType.REGISTRATION:
      return;
    default:
      return;
  }
}
