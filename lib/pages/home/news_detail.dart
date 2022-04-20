import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../constants/string.dart';
import '../../controllers/headlines_news/news_detail_controller.dart';
import '../about/about_me.dart';

// ignore: must_be_immutable
class NewsDetails extends GetView<NewsDetailsController> {
  NewsDetails({Key? key}) : super(key: key);

  @override
  NewsDetailsController controller = Get.put(NewsDetailsController());

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
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back_ios,
              color: context.theme.primaryColor, size: 30),
        ),
        elevation: 0,
        backgroundColor: context.theme.backgroundColor,
        actions: [
          IconButton(
            onPressed: () {
              Get.to(() => const AboutMe());
            },
            icon: Icon(
              Icons.info,
              color: context.theme.primaryColor,
            ),
          ),
        ],
      );
    }

    Widget body() {
      return Obx(() {
        return controller.url.value.isNotEmpty
            ? Stack(
                children: [
                  WebView(
                    initialUrl: controller.url.value,
                    javascriptMode: JavascriptMode.unrestricted,
                    onPageFinished: (finish) {
                      controller.isLoading.value = false;
                    },
                    onWebViewCreated: (WebViewController webViewController) {
                      webViewController = webViewController;
                    },
                  ),
                  Obx(() {
                    return controller.isLoading.value
                        ? Center(
                            child: CircularProgressIndicator(
                              backgroundColor: Colors.white,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                  context.theme.primaryColor),
                            ),
                          )
                        : Container();
                  })
                ],
              )
            : const SizedBox();
      });
    }

    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: appBar(),
      body: body(),
    );
  }
}
