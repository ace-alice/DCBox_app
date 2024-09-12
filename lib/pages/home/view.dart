import 'package:dc_box_app/core/user_manager/state.dart';
import 'package:dc_box_app/pages/home/widgets/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final UserState userState = Get.put(UserState());

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    final state = Bind.find<HomeController>().state;

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      child: Column(
        children: [
          bannerCarousel(),
          marquee(state),
          enterCard(),
          accountInfo(),
          orderVolume(),
          assetDetails(),
        ],
      ),
    );
  }
}
