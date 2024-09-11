import 'package:get/get.dart';

import '../../network/api/get_country_list.dart';

class SelectCountryCodeController extends GetxController {
  Rx<CountryCodeResponse> countryCode =
      CountryCodeResponse(name: '中国', code: '86').obs;
}
