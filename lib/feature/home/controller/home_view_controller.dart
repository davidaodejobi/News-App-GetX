// ignore_for_file: avoid_print

import 'package:get/get.dart';
import 'package:news_app_getx/core/repository/new_repository_impl.dart';
import 'package:news_app_getx/core/repository/news_repository.dart';

import '../../../core/model/article.dart';

class HomeController extends GetxController {
  NewsRepository? _newsRepository;

  HomeController() {
    _newsRepository = Get.find<NewsRepositoryImpl>();
    loadCategoryNewsLine('general');
  }

  late RxList<Article> articles;

  RxBool isLoading = false.obs;

  loadCategoryNewsLine(String category) async {
    showLoading();

    final result = await _newsRepository!.getNewsHeadlineByCategory(category);

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

  RxList<String> listOfCategory = [
    'business',
    'entertainment',
    'general',
    'health',
    'science',
    'sports',
    'technology'
  ].obs;
}
