import 'package:get/get.dart';

import '../../network/api/get_currency_list.dart';
import 'currency_list_manager.dart';
import 'state.dart';

class CurrencyListManagerImpl implements CurrencyListManager {
  final GetCurrencyListHttp _getCurrencyListHttp;

  CurrencyListState currencyListState = Get.put(CurrencyListState());

  CurrencyListManagerImpl({required GetCurrencyListHttp getCurrencyListHttp})
      : _getCurrencyListHttp = getCurrencyListHttp;

  @override
  Future init() async {
    try {
      CurrencyListResponse response =
          await _getCurrencyListHttp.request(CurrencyListResData());
      currencyListState.currencyList.value = response.currencyList;
    } catch (e) {
      rethrow;
    }
  }
}
