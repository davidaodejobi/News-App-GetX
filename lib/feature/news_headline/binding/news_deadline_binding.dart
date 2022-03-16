import 'package:get/get.dart';
import 'package:news_app_getx/core/repository/new_repository_impl.dart';

import '../controller/news_headline_controller.dart';

class NewsHeadlineBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(NewsRepositoryImpl());
    Get.put(NewsHeadlineController());
  }
}
