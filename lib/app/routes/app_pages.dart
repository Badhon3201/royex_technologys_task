import 'package:get/get.dart';

import 'package:royex_technologys_task/app/modules/issues/bindings/issues_binding.dart';
import 'package:royex_technologys_task/app/modules/issues/views/issues_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.ISSUES;

  static final routes = [
    GetPage(
      name: _Paths.ISSUES,
      page: () => const IssuesView(),
      binding: IssuesBinding(),
    ),
  ];
}
