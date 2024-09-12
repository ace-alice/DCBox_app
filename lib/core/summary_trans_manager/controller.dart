import 'package:dc_box_app/core/summary_trans_manager/index.dart';
import 'package:get/get.dart';

import '../../network/api/summary_trans.dart';

class SummaryTransManagerImpl implements SummaryTransManager {
  SummaryTransState summaryTransState = Get.put(SummaryTransState());

  final SummaryTransHttp _summaryTransHttp;

  SummaryTransManagerImpl({required SummaryTransHttp summaryTransHttp})
      : _summaryTransHttp = summaryTransHttp;

  @override
  Future init() async {
    try {
      SummaryTransResponse response =
          await _summaryTransHttp.request(SummaryTransResData());
      summaryTransState.summaryTrans.value = response;
    } catch (e) {
      rethrow;
    }
  }
}
