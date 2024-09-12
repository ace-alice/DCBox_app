import '../http/base_res_data.dart';
import '../http/base_response.dart';
import '../http/http_manager.dart';
import '../models/currency_item.dart';

class GetCurrencyListHttp
    extends HttpManager<CurrencyListResponse, CurrencyListResData> {
  GetCurrencyListHttp(
      {required super.deviceManager,
      required super.langManager,
      required super.envState});

  @override
  String get path => 'exchangeCurrency/queryCurrencyList';

  @override
  CurrencyListResponse jsonBodyDecoder(data) {
    return CurrencyListResponse.decode(data);
  }
}

class CurrencyListResponse extends AppResponse {
  final List<CurrencyItem> currencyList;

  CurrencyListResponse(this.currencyList);

  static CurrencyListResponse decode(dynamic data) {
    final list =
        (data as List<dynamic>).map((e) => CurrencyItem.fromJson(e)).toList();
    return CurrencyListResponse(list);
  }
}

class CurrencyListResData extends BaseResData {
  final String securityId;

  CurrencyListResData({this.securityId = ''});

  @override
  Map<String, dynamic> toMap() {
    return {'securityId': securityId};
  }
}
