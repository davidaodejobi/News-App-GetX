import 'package:get/get.dart';
import 'package:news_app_getx/core/repository/new_repository_impl.dart';

import '../controller/home_view_controller.dart';

class HomeViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(NewsRepositoryImpl());
    Get.put(HomeViewController());
  }
}
