import '../http/base_res_data.dart';
import '../http/base_response.dart';
import '../http/http_manager.dart';
import '../models/user_balance_model.dart';

class GetKycStatusHttp
    extends HttpManager<KycStatusResponse, KycStatusResData> {
  GetKycStatusHttp(
      {required super.deviceManager,
      required super.langManager,
      required super.envState});

  @override
  String get path => 'exchangeUser/getUserBalance';

  @override
  KycStatusResponse jsonBodyDecoder(data) {
    return KycStatusResponse.jsonDecode(data);
  }
}

class KycStatusResponse extends AppResponse {
  final UserBalanceModel result;

  KycStatusResponse({
    required this.result,
  });

  static KycStatusResponse jsonDecode(dynamic data) {
    UserBalanceModel result = UserBalanceModel.fromJson(data);

    return KycStatusResponse(
      result: result,
    );
  }
}

class KycStatusResData extends BaseResData {
  KycStatusResData();

  @override
  Map<String, dynamic> toMap() {
    return {};
  }
}
