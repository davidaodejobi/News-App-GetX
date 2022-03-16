// ignore_for_file: avoid_print

import 'package:get/get.dart';
import 'package:news_app_getx/core/repository/new_repository_impl.dart';
import 'package:news_app_getx/core/repository/news_repository.dart';

import '../../../core/model/article.dart';

class NewsHeadlineController extends GetxController {
  NewsRepository? _newsRepository;

  NewsHeadlineController() {
    _newsRepository = Get.find<NewsRepositoryImpl>();
    loadNewsLine();
  }

  late RxList<Article> articles;

  RxBool isLoading = false.obs;

  loadNewsLine() async {
    showLoading();

    final result = await _newsRepository!.getNewsHeadline();

    hideLoading();

    // ignore: unnecessary_null_comparison
    if (result != null) {
      articles = result.obs;
      // print(articles);
      update();
    } else {
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
