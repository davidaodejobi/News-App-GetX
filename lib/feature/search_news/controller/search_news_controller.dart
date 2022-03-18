import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../core/model/article.dart';
import '../../../core/repository/new_repository_impl.dart';
import '../../../core/repository/news_repository.dart';

class SearchNewsController {
  NewsRepository? _newsRepository;

  SearchNewsController() {
    _newsRepository = Get.find<NewsRepositoryImpl>();

    searchTextController.addListener(() {
      if (searchTextController.text.length % 3 == 0 &&
          searchTextController.text.isNotEmpty) {
        searchNewsHeadline();
      }
    });
  }

  final searchTextController = TextEditingController();

  RxList<Article> articles = RxList();

  RxBool isLoading = false.obs;

  searchNewsHeadline() async {
    showLoading();

    final result =
        await _newsRepository!.getSearchNews(searchTextController.text);

    hideLoading();

    // ignore: unnecessary_null_comparison
    if (result != null) {
      articles = result.obs;
    } else {
      // ignore: avoid_print
      print('An error occurred');
    }
  }

  showLoading() {
    //isLoading = true.obs; another way to do it
    isLoading.toggle();
  }

  hideLoading() {
    //isLoading = false.obs; another way to do it
    isLoading.toggle();
  }
}
