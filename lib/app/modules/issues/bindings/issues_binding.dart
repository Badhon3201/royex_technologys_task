import 'package:get/get.dart';

import '../controllers/issues_controller.dart';

class IssuesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IssuesController>(
      () => IssuesController(),
    );
  }
}
