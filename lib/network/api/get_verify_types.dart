import 'package:dc_box_app/common/biz_types.dart';

import '../http/base_res_data.dart';
import '../http/base_response.dart';
import '../http/http_manager.dart';
import '../models/verify_types_model.dart';

class GetVerifyTypesHttp
    extends HttpManager<GetVerifyTypesResponse, GetVerifyTypesResData> {
  GetVerifyTypesHttp(
      {required super.deviceManager,
      required super.langManager,
      required super.envState});

  @override
  String get path => 'security/getVerifyTypes';

  @override
  GetVerifyTypesResponse jsonBodyDecoder(data) {
    return GetVerifyTypesResponse.jsonDecode(data);
  }
}

class GetVerifyTypesResponse extends AppResponse {
  final VerifyTypesModel model;

  GetVerifyTypesResponse({
    required this.model,
  });

  static GetVerifyTypesResponse jsonDecode(dynamic data) {
    VerifyTypesModel model = VerifyTypesModel.fromJson(data);

    return GetVerifyTypesResponse(
      model: model,
    );
  }
}

class GetVerifyTypesResData extends BaseResData {
  final BizType bizType;
  final String? requestId;
  final String? s0;

  GetVerifyTypesResData({required this.bizType, this.requestId, this.s0});

  @override
  Map<String, dynamic> toMap() {
    return {
      'bizType': bizType.name,
      's0': s0,
      'requestId': requestId,
    };
  }
}
