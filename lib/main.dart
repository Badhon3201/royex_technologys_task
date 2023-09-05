import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:royex_technologys_task/app/core/utils/reponsive_ui_service.dart';
import 'package:royex_technologys_task/app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: 'Royex Technologys Task',
      builder: (context, child) {
        // Your figma design size
        ResponsiveUIService().init(const Size(375, 812), context);
        return SafeArea(child: child!);
      },
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
