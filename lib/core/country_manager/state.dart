import 'package:get/get.dart';

import '../../network/api/get_country_list.dart';

class CountryState {
  RxList<CountryCodeResponse> list = RxList([]);

  CountryState() {
    /// init state
  }
}
