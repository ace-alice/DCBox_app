import '../http/base_res_data.dart';
import '../http/base_response.dart';
import '../http/http_manager.dart';
import '../models/user_info_model.dart';

class GetUserInfoHttp extends HttpManager<UserInfoResponse, UserInfoResData> {
  GetUserInfoHttp(
      {required super.deviceManager,
      required super.langManager,
      required super.envState});

  @override
  String get path => 'exchangeUser/getUserInfo';

  @override
  UserInfoResponse jsonBodyDecoder(data) {
    return UserInfoResponse.jsonDecode(data);
  }
}

class UserInfoResponse extends AppResponse {
  final UserInfoModel result;

  UserInfoResponse({
    required this.result,
  });

  static UserInfoResponse jsonDecode(dynamic data) {
    UserInfoModel result = UserInfoModel.fromJson(data);

    return UserInfoResponse(
      result: result,
    );
  }
}

class UserInfoResData extends BaseResData {
  UserInfoResData();

  @override
  Map<String, dynamic> toMap() {
    return {};
  }
}
