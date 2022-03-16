import 'package:get/get.dart';

import '../controller/search_news_controller.dart';

class SearchNewsBinding with Bindings {
  @override
  void dependencies() {
    Get.put(SearchNewsController());
  }
}
