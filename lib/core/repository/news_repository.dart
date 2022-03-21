import 'package:news_app_getx/core/model/article.dart';

abstract class NewsRepository {
  // Future<List<Article>> getNewsHeadline();
  Future<List<Article>> getSearchNews(String query);
  Future<List<Article>> getNewsHeadlineByCategory(String category);
}
