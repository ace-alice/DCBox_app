import 'package:get/get.dart';

import '../../network/api/summary_trans.dart';

class SummaryTransState {
  Rx<SummaryTransResponse> summaryTrans =
      SummaryTransResponse(tranAmount: 0, tranCount: 0).obs;

  SummaryTransState() {
    /// init data
  }
}
