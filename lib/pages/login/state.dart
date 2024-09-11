import 'package:get/get.dart';

import '../../network/api/get_country_list.dart';

class LoginState {
  Rx<CountryCodeResponse> countryCode =
      CountryCodeResponse(name: '中国', code: '86').obs;

  LoginState() {
    ///Initialize variables
  }
}
