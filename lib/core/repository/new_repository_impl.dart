// ignore_for_file: avoid_print

import 'package:get/get.dart';
import 'package:news_app_getx/core/model/article.dart';
import 'package:news_app_getx/core/model/news_response.dart';
import 'package:news_app_getx/core/repository/news_repository.dart';
import 'package:news_app_getx/service/http_service.dart';
import 'package:news_app_getx/service/http_service_impl.dart';

class NewsRepositoryImpl implements NewsRepository {
  HttpService? _httpService;

  NewsRepositoryImpl() {
    _httpService = Get.put(HttpServiceImpl());
    _httpService!.init();
  }

  @override
  Future<List<Article>> getNewsHeadline() async {
    try {
      final response =
          await _httpService!.getRequest('top-headlines?country=us');
      // print(response.data);
      final parsedResponse = NewsResponse.fromJson(response.data);

      return parsedResponse.articles ?? [];
    } on Exception catch (e) {
      print(e);
      return Future.error(e);
    }
  }

  // @override
  // Future<List<Article>> getNewsHeadlineByCategory(String category)
  //     throw UnimplementedError();
  // }

  @override
  Future<List<Article>> getSearchNews(String query) async {
    try {
      final response =
          await _httpService!.getRequest('top-headlines?country=us');
      final parsedResponse = NewsResponse.fromJson(response.data);
      return parsedResponse.articles as List<Article>;
    } on Exception catch (e) {
      print(e);
      return Future.error(e);
    }
  }
}
