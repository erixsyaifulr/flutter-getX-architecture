import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_architecture/routes/app_page.dart';

import 'services/api_handler/api_handler.dart';
import 'services/api_handler/api_repository.dart';
import 'themes/theme.dart';
import 'themes/theme_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(ApiBaseHelper(), permanent: true);
  Get.put(ApiRepository(Get.find()));
  runApp(
    GetMaterialApp(
      title: "Newsify",
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      theme: Themes.light,
      darkTheme: Themes.dark,
      themeMode: ThemeService().theme,
    ),
  );
}
