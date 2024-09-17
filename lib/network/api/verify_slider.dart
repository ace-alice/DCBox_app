import '../http/base_res_data.dart';
import '../http/base_response.dart';
import '../http/http_manager.dart';
import '../models/verify_slide_model.dart';

class VerifySliderHttp
    extends HttpManager<VerifySliderResponse, VerifySliderResData> {
  VerifySliderHttp(
      {required super.deviceManager,
      required super.langManager,
      required super.envState});

  @override
  String get path => 'common/validateSlider';

  @override
  VerifySliderResponse jsonBodyDecoder(data) {
    return VerifySliderResponse.jsonDecode(data);
  }
}

class VerifySliderResponse extends AppResponse {
  final VerifySlideModel result;

  VerifySliderResponse({
    required this.result,
  });

  static VerifySliderResponse jsonDecode(dynamic data) {
    VerifySlideModel result = VerifySlideModel.fromJson(data);

    return VerifySliderResponse(
      result: result,
    );
  }
}

class VerifySliderResData extends BaseResData {
  final String captchaId;
  final double x;
  final double y;

  VerifySliderResData({
    required this.captchaId,
    required this.x,
    required this.y,
  });

  @override
  Map<String, dynamic> toMap() {
    return {'captchaId': captchaId, 'x': x, 'y': y};
  }
}
