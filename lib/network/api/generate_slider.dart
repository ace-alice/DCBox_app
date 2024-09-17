import 'package:dc_box_app/common/biz_types.dart';

import '../http/base_res_data.dart';
import '../http/base_response.dart';
import '../http/http_manager.dart';
import '../models/slider_model.dart';

class GenerateSliderHttp
    extends HttpManager<GenerateSliderResponse, GenerateSliderResData> {
  GenerateSliderHttp(
      {required super.deviceManager,
      required super.langManager,
      required super.envState});

  @override
  String get path => 'common/generateSlider';

  @override
  GenerateSliderResponse jsonBodyDecoder(data) {
    return GenerateSliderResponse.jsonDecode(data);
  }
}

class GenerateSliderResponse extends AppResponse {
  final SliderModel model;

  GenerateSliderResponse({
    required this.model,
  });

  static GenerateSliderResponse jsonDecode(dynamic data) {
    SliderModel model = SliderModel.fromJson(data);

    return GenerateSliderResponse(
      model: model,
    );
  }
}

class GenerateSliderResData extends BaseResData {
  final BizType bizType;

  GenerateSliderResData({required this.bizType});

  @override
  Map<String, dynamic> toMap() {
    return {'bizType': bizType.name};
  }
}
