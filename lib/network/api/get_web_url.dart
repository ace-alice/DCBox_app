import '../http/aes_http_manager.dart';
import '../http/base_res_data.dart';
import '../http/base_response.dart';

class GetWebUrlHttp extends AesHttpManager<WebUrlResponse, WebUrlResData> {
  GetWebUrlHttp({required super.deviceManager, required super.langManager});

  @override
  bool get isNotAes => true;

  @override
  String get path => 'lucky_common/h5domainNames';

  @override
  WebUrlResponse jsonBodyDecoder(data) {
    return WebUrlResponse.decode(data);
  }
}

class WebUrlResponse extends AppResponse {
  final List<String> domains;

  WebUrlResponse(this.domains);

  factory WebUrlResponse.decode(List<dynamic> data) {
    return WebUrlResponse(data.map((e) => e.toString()).toList());
  }
}

class WebUrlResData extends BaseResData {
  @override
  Map<String, dynamic> toMap() {
    return {};
  }
}
