import 'package:dc_box_app/core/notice_bar_manager/index.dart';
import 'package:dc_box_app/network/models/bulletin_item.dart';

import '../http/base_res_data.dart';
import '../http/base_response.dart';
import '../http/http_manager.dart';

class GetBulletinsHttp
    extends HttpManager<BulletinsResponse, BulletinsResData> {
  GetBulletinsHttp(
      {required super.deviceManager,
      required super.langManager,
      required super.envState});

  @override
  String get path => 'bulletin/getBulletins';

  @override
  BulletinsResponse jsonBodyDecoder(data) {
    return BulletinsResponse.decode(data);
  }
}

class BulletinsResponse extends AppResponse {
  final List<BulletinItem> bulletinList;

  BulletinsResponse(this.bulletinList);

  static BulletinsResponse decode(dynamic data) {
    final list =
        (data as List<dynamic>).map((e) => BulletinItem.fromJson(e)).toList();
    return BulletinsResponse(list);
  }
}

class BulletinsResData extends BaseResData {
  final BulletinType type;

  BulletinsResData({this.type = BulletinType.marquee});

  @override
  Map<String, dynamic> toMap() {
    return {'type': type.index};
  }
}
