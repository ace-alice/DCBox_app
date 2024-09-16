import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/app_color.dart';
import '../../../router/app_routes.dart';

class RegisterAppBar extends StatelessWidget {
  const RegisterAppBar({super.key});

  @override
  AppBar build(BuildContext context) {
    return AppBar(
      leading: null,
      automaticallyImplyLeading: false,
      backgroundColor: AppColor.backdrop121212,
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: GestureDetector(
            onTap: () {
              Get.toNamed(AppRoutes.app);
              Get.removeRoute(AppRoutes.register);
            },
            child: const Icon(
              Icons.close,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
