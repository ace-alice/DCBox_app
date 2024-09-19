import '../http/base_res_data.dart';
import '../http/base_response.dart';
import '../http/http_manager.dart';
import '../models/user_balance_model.dart';

class GetUserBalanceHttp
    extends HttpManager<UserBalanceResponse, UserBalanceResData> {
  GetUserBalanceHttp(
      {required super.deviceManager,
      required super.langManager,
      required super.envState});

  @override
  String get path => 'exchangeUser/getUserBalance';

  @override
  UserBalanceResponse jsonBodyDecoder(data) {
    return UserBalanceResponse.jsonDecode(data);
  }
}

class UserBalanceResponse extends AppResponse {
  final UserBalanceModel result;

  UserBalanceResponse({
    required this.result,
  });

  static UserBalanceResponse jsonDecode(dynamic data) {
    UserBalanceModel result = UserBalanceModel.fromJson(data);

    return UserBalanceResponse(
      result: result,
    );
  }
}

class UserBalanceResData extends BaseResData {
  UserBalanceResData();

  @override
  Map<String, dynamic> toMap() {
    return {};
  }
}
