import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/tr_key.dart';
import 'controller.dart';
import 'widgets/index.dart';

class PersonalPage extends StatelessWidget {
  const PersonalPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PersonalController());
    final state = Bind.find<PersonalController>().state;

    return Scaffold(
      appBar: AppBar(
        title: Text(TrKey.mine.tr),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: Column(
          children: [
            NickContent(),
            const SizedBox(height: 10),
            SafetyInfo(),
            const SizedBox(height: 10),
            const OperationGroup(),
            const SizedBox(height: 28),
            SignOut(),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
