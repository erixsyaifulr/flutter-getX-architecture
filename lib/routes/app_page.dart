import 'package:get/get.dart';
import 'package:my_architecture/routes/app_route.dart';

import '../bindings/head_line_news/head_line_news_binding.dart';
import '../pages/home/head_line_news_list.dart';

class AppPages {
  AppPages._();
  static const initial = Routes.home;
  static final routes = [
    GetPage(
      name: Paths.home,
      page: () => HeadLineNewsList(),
      binding: TopHeadLinesNewsBinding(),
    ),
  ];
}
