import '../http/base_res_data.dart';
import '../http/base_response.dart';
import '../http/http_manager.dart';

class LogoutHttp extends HttpManager<LogoutResponse, LogoutResData> {
  LogoutHttp(
      {required super.deviceManager,
      required super.langManager,
      required super.envState});

  @override
  String get path => 'exchangeUser/logout';

  @override
  LogoutResponse jsonBodyDecoder(data) {
    return LogoutResponse.jsonDecode(data);
  }
}

class LogoutResponse extends AppResponse {
  final bool result;

  LogoutResponse({
    required this.result,
  });

  static LogoutResponse jsonDecode(dynamic data) {
    bool result = bool.parse(data.toString());

    return LogoutResponse(
      result: result,
    );
  }
}

class LogoutResData extends BaseResData {
  LogoutResData();

  @override
  Map<String, dynamic> toMap() {
    return {};
  }
}
