import 'package:get/get.dart';

import '../../network/api/get_country_list.dart';
import '../lang_manager/index.dart';
import 'country_manager.dart';
import 'state.dart';

class CountryManagerImpl implements CountryManager {
  final GetCountryListHttp _getCountryListHttp;

  final LangManager _langManager;

  CountryManagerImpl({
    required GetCountryListHttp getCountryListHttp,
    required LangManager langManager,
  })  : _getCountryListHttp = getCountryListHttp,
        _langManager = langManager {
    // ever(_langManager.langType, (value) {
    //   reLoad();
    // });
  }

  final CountryState countryState = Get.put(CountryState());

  @override
  Future init() async {
    try {
      if (countryState.list.value.isEmpty) {
        await reLoad();
      }
    } catch (_) {
      rethrow;
    }
  }

  Future reLoad() async {
    CountryListResponse response =
        await _getCountryListHttp.request(CountryListResData());
    if (response.countryList.isNotEmpty) {
      countryState.list.value = response.countryList;
    }
  }
}
