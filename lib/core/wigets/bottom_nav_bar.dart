import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app_getx/core/model/tab_manager.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../../feature/news_headline/controller/news_headline_controller.dart';
import '../../feature/news_headline/view/news_headline_view.dart';
import '../../feature/search_news/controller/search_news_controller.dart';
import '../../feature/search_news/view/search_news_view.dart';
import '../repository/new_repository_impl.dart';

// ignore: must_be_immutable
class BottomNavBar extends StatelessWidget {
  BottomNavBar({Key? key}) : super(key: key);

  final tabManager = Get.put(TabManager(), permanent: false);
  final controller = Get.lazyPut(() => NewsHeadlineController());
  final controller1 = Get.lazyPut(() => SearchNewsController());
  final controller2 = Get.lazyPut(() => NewsRepositoryImpl());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return Scaffold(
          body: IndexedStack(
            index: tabManager.currentPage!.value,
            children: [
              Container(
                color: Colors.red,
              ),
              NewsHeadlineView(),
              SearchNewsView(),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            onTap: (int index) {
              tabManager.selectedPage(index);
            },
            currentIndex: tabManager.currentPage!.value,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            elevation: 0,
            items: [
              BottomNavigationBarItem(
                icon: WebsafeSvg.asset('assets/icons/home_unselected.svg'),
                activeIcon: WebsafeSvg.asset('assets/icons/home_selected.svg'),
                tooltip: 'Home',
                label: '',
              ),
              BottomNavigationBarItem(
                icon: WebsafeSvg.asset('assets/icons/search_unselected.svg'),
                activeIcon:
                    WebsafeSvg.asset('assets/icons/search_selected.svg'),
                tooltip: 'Search',
                label: '',
              ),
              BottomNavigationBarItem(
                icon: WebsafeSvg.asset('assets/icons/bookmark_unselected.svg'),
                activeIcon:
                    WebsafeSvg.asset('assets/icons/bookmark_selected.svg'),
                tooltip: 'Bookmark',
                label: '',
              ),
            ],
          ),
        );
      },
    );
  }
}
