import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/string.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({Key? key}) : super(key: key);

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
              onPressed: () {},
              icon: Icon(
                Icons.info,
                color: context.theme.primaryColor,
              ))
        ],
      );
    }

    Widget body() {
      return Column(
        children: [
          const SizedBox(height: 10),
          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                alignment: Alignment.center,
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  border:
                      Border.all(width: 1, color: context.theme.primaryColor),
                  color: context.theme.backgroundColor,
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                      topLeft: Radius.circular(50),
                      bottomLeft: Radius.circular(50)),
                ),
                child: Text(
                  "BS",
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      StringConstants.developerName,
                      textAlign: TextAlign.justify,
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    Text(
                      StringConstants.appName,
                      textAlign: TextAlign.justify,
                      style: Theme.of(context).textTheme.headline1,
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      );
    }

    return Scaffold(
      appBar: appBar(),
      body: body(),
    );
  }
}
