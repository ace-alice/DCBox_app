import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/app_color.dart';
import '../../../core/currency_list_manager/index.dart';
import '../../../core/user_manager/index.dart';
import '../../../network/models/user_balance_model.dart';

Widget assetDetails() {
  CurrencyListState currencyListState = Get.put(CurrencyListState());
  UserState userState = Get.put(UserState());

  String getBalance(String currency) {
    if (userState.token.value.isEmpty) {
      return '--';
    }
    if (userState.totalBalance.value.balanceList.isNotEmpty) {
      BalanceList? listItem =
          userState.totalBalance.value.balanceList.firstWhere((item) {
        return item.exchangeCurrency == currency;
      },
              orElse: () => const BalanceList(
                    currency: '',
                    balance: 0,
                    exchangeRate: 0,
                    exchangeCurrency: '',
                    exchangeBalance: 0,
                  ));
      return listItem.balance.toString();
    }
    return '--';
  }

  return Container(
    margin: const EdgeInsets.only(top: 12),
    padding: const EdgeInsets.all(15),
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: AppColor.backdrop222222,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 6),
          child: Text(
            '资产详情',
            style: TextStyle(
              fontSize: 14,
              height: 1.25,
              color: AppColor.text9A9AA0,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: Obx(
            () => Column(
              children: currencyListState.currencyList.value.map((currency) {
                return Container(
                  height: 56,
                  decoration:
                      currencyListState.currencyList.value.last.currency ==
                              currency.currency
                          ? null
                          : const BoxDecoration(
                              border: Border(
                              bottom: BorderSide(
                                color: Color.fromRGBO(109, 119, 139, 0.3),
                                // 底部边框颜色
                                width: 0.5, // 底部边框宽度
                              ),
                            )),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      currency.getIcon(),
                      Flexible(
                        child: Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.symmetric(horizontal: 6),
                          child: Text(
                            currency.currency,
                            style: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      Text(
                        getBalance(currency.currency),
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    ),
  );
}
