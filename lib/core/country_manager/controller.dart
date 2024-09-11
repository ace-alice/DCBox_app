import 'package:dc_box_app/common/app_logger.dart';
import 'package:get/get.dart';

import '../../network/api/get_country_list.dart';
import 'country_manager.dart';
import 'state.dart';

class CountryManagerImpl implements CountryManager {
  final GetCountryListHttp _getCountryListHttp;

  CountryManagerImpl({required GetCountryListHttp getCountryListHttp})
      : _getCountryListHttp = getCountryListHttp;

  final CountryState countryState = Get.put(CountryState());

  @override
  Future init() async {
    try {
      logger.d('message ${countryState.list.value.toString()}');
      if (countryState.list.value.isEmpty) {
        CountryListResponse response =
            await _getCountryListHttp.request(CountryListResData());
        if (response.countryList.isNotEmpty) {
          countryState.list.value = response.countryList;
        }
      }
    } catch (_) {
      rethrow;
    }
  }
}
