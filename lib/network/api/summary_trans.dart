import '../http/base_res_data.dart';
import '../http/base_response.dart';
import '../http/http_manager.dart';

class SummaryTransHttp
    extends HttpManager<SummaryTransResponse, SummaryTransResData> {
  SummaryTransHttp(
      {required super.deviceManager,
      required super.langManager,
      required super.envState});

  @override
  String get path => 'exchangePay/summaryTransIn24Hours';

  @override
  SummaryTransResponse jsonBodyDecoder(data) {
    return SummaryTransResponse.jsonDecode(data);
  }
}

class SummaryTransResponse extends AppResponse {
  final num tranAmount;
  final num tranCount;

  SummaryTransResponse({
    required this.tranAmount,
    required this.tranCount,
  });

  static SummaryTransResponse jsonDecode(dynamic data) {
    final num tranAmount = data['tranAmount'] ?? 0.0;
    final num tranCount = data['tranCount'] ?? 0;

    return SummaryTransResponse(
      tranAmount: tranAmount,
      tranCount: tranCount,
    );
  }
}

class SummaryTransResData extends BaseResData {
  @override
  Map<String, dynamic> toMap() {
    return {};
  }
}
