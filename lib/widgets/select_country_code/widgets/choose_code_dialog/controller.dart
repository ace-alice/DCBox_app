import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../core/country_manager/state.dart';
import '../../../../network/api/get_country_list.dart';

class ChooseCodeDialogController extends GetxController {
  final CountryState countryState = Get.put(CountryState());

  RxString searchText = ''.obs;

  ScrollController scrollController = ScrollController();

  List<CountryCodeResponse> get searchList {
    return countryState.list.value.where((item) {
      if (searchText.value.isNotEmpty) {
        return item.code.toString().contains(searchText.value) ||
            item.name.contains(searchText.value);
      }
      return true;
    }).toList();
  }

  @override
  void onReady() {
    super.onReady();
    ever(searchText, (value) {
      scrollController.jumpTo(0);
    });
  }
}
