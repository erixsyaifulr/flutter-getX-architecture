import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/string.dart';
import '../../controllers/headlines_news/headline_news_controller.dart';
import '../../themes/theme_service.dart';
import '../../widgets/category_item.dart';
import '../../widgets/news_item.dart';
import '../about/about_me.dart';
import 'news_detail.dart';

// ignore: must_be_immutable
class HeadLineNewsList extends GetView<HeadLinesNewsListController> {
  HeadLineNewsList({Key? key}) : super(key: key);

  @override
  HeadLinesNewsListController controller =
      Get.put(HeadLinesNewsListController(Get.find()));

  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget appBar() {
      return AppBar(
        titleSpacing: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              StringConstants.appName,
              style: Theme.of(context).textTheme.headline1,
            ),
            Text(
              StringConstants.developerName,
              style: Theme.of(context).textTheme.headline6,
            )
          ],
        ),
        leading: Icon(
          Icons.list_alt_rounded,
          color: context.theme.primaryColor,
          size: 45,
        ),
        elevation: 0,
        backgroundColor: context.theme.backgroundColor,
        actions: [
          IconButton(
              onPressed: () {
                ThemeService().switchTheme();
              },
              icon: Icon(
                Icons.wb_sunny,
                color: context.theme.primaryColor,
              )),
          IconButton(
              onPressed: () {
                Get.to(() => const AboutMe());
              },
              icon: Icon(
                Icons.info,
                color: context.theme.primaryColor,
              ))
        ],
      );
    }

    Widget body() {
      return SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 70,
              child: Obx(() {
                return controller.categoryList.isNotEmpty
                    ? ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.categoryList.length,
                        itemBuilder: (context, index) {
                          return CategoryItem(
                            category: controller.categoryList[index],
                            onPressed: (value) {
                              controller.changeCategoryNews(value);
                            },
                          );
                        })
                    : const SizedBox();
              }),
            ),
            Obx(() {
              if (controller.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: controller.headLinesNewsList.length,
                  itemBuilder: (context, index) {
                    return HeadLineNewsItem(
                      newsModel: controller.headLinesNewsList[index],
                      onPressed: (value) {
                        Get.to(() => NewsDetails(), arguments: [
                          controller.headLinesNewsList[index].url
                        ]);
                      },
                    );
                  },
                );
              }
            })
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: appBar(),
      body: body(),
    );
  }
}
