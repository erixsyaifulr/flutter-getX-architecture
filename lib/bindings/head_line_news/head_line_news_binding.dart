import 'package:get/get.dart';
import 'package:my_architecture/controllers/headlines_news/headline_news_controller.dart';

class TopHeadLinesNewsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<HeadLinesNewsListController>(
        HeadLinesNewsListController(Get.find()));
  }
}
