import 'package:get/get.dart';
import 'package:my_architecture/constants/endpoints.dart';
import 'package:my_architecture/models/category.dart';
import 'package:my_architecture/models/head_line.dart';
import 'package:my_architecture/services/api_handler/api_extension.dart';

import '../../services/api_handler/api_repository.dart';

class HeadLinesNewsListController extends FullLifeCycleController
    with FullLifeCycleMixin {
  // initialization api repo for accessing http function
  ApiRepository apiRepository;
  HeadLinesNewsListController(this.apiRepository);

  var isLoading = true.obs;
  RxString categoryName = "".obs;

  var headLinesNewsList = List<HeadLineNews>.empty(growable: true).obs;
  var categoryList = List<Category>.empty(growable: true).obs;

  @override
  void onReady() {
    super.onReady();

    getSourceList();
  }

  @override
  void onDetached() {}

  @override
  void onInactive() {}

  @override
  void onPaused() {}

  @override
  void onResumed() {}

  //get all News list
  void getNewsList(categoryName) {
    isLoading.value = true;
    headLinesNewsList.clear();
    Map<String, dynamic> newsParam = {
      "country": EndPoints.countryCode,
      "category": categoryName,
      "apiKey": EndPoints.apiKey
    };
    apiRepository
        .getTopHeadLines(newsParam)
        .getResponse<Response<String>>((response) {
      if (response.data['status'] == "ok") {
        isLoading.value = false;
        List newsListData = response.data['articles'];
        var parsingList =
            newsListData.map((m) => HeadLineNews.fromJson(m)).toList();
        headLinesNewsList.addAll(parsingList);
      }
    });
  }

  //get all Category by source news api
  void getSourceList() {
    categoryList.add(Category(
      category: "business",
      url:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQEYB-hL3Z9ucn3hw5gZJUt__UV5gQm9kASwV6TeFZNnclRxp4dDbOCwutTGAWw7J1BZTU&usqp=CAU",
    ));
    categoryList.add(Category(
      category: "technology",
      url:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSF1E01q7VUqcaQkq5EU3jn1-bGbk44NTQdDK6sqR19CXfziemeUvtvxARuYgx_ZvVqjd0&usqp=CAU",
    ));
    categoryList.add(Category(
      category: "general",
      url: "https://cdn.mos.cms.futurecdn.net/XfREyDUvNNapfMnMPV4QMk.jpg",
    ));

    changeCategoryNews(categoryList[0].category);
  }

  void changeCategoryNews(categoryName) {
    getNewsList(categoryName);
  }
}
