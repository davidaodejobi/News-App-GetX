import 'package:get/get.dart';

class TabManager extends GetxController {
  RxInt? currentPage = 0.obs;

  selectedPage(int index) {
    currentPage!.value = index;
  }
}
