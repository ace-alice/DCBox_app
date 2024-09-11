import 'package:dc_box_app/network/http/http_manager.dart';
import 'package:flutter/cupertino.dart';

import '../../generated/app_image/app_image.dart';
import '../http/base_res_data.dart';
import '../http/base_response.dart';

class GetCountryListHttp
    extends HttpManager<CountryListResponse, CountryListResData> {
  GetCountryListHttp(
      {required super.deviceManager,
      required super.langManager,
      required super.envState});

  @override
  String get path => 'common/getCountryCode';

  @override
  CountryListResponse jsonBodyDecoder(data) {
    return CountryListResponse.decode(data);
  }
}

class CountryListResponse extends AppResponse {
  final List<CountryCodeResponse> countryList;

  CountryListResponse(this.countryList);

  static CountryListResponse decode(dynamic data) {
    final list = (data as List<dynamic>)
        .map((e) => CountryCodeResponse.jsonDecode(e))
        .toList();
    return CountryListResponse(list);
  }
}

class CountryCodeResponse {
  final String name;
  final String code;

  Widget getCountryByCode({
    BoxFit fit = BoxFit.contain,
    double? width = 20,
    double? height = 20,
  }) {
    return AppImage.country.getImageWith(
      name: 'ic$code',
      fit: fit,
      width: width,
      height: height,
    );
  }

  CountryCodeResponse({
    required this.name,
    required this.code,
  });

  static CountryCodeResponse jsonDecode(dynamic data) {
    final String name = data['countryName'] ?? '';
    final String code = data['countryCode'] ?? '';

    return CountryCodeResponse(
      name: name,
      code: code,
    );
  }
}

class CountryListResData extends BaseResData {
  @override
  Map<String, dynamic> toMap() {
    return {};
  }
}
