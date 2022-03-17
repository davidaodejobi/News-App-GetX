import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app_getx/core/wigets/bottom_nav_bar.dart';
import 'package:news_app_getx/feature/search_news/binding/search_news_binding.dart';

import 'feature/news_headline/binding/news_deadline_binding.dart';
import 'feature/news_headline/view/news_headline_view.dart';
import 'feature/search_news/view/search_news_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BottomNavBar(),
      // getPages: [
      //   GetPage(
      //       name: "/news_headline",
      //       page: () => NewsHeadlineView(),
      //       binding: NewsHeadlineBinding()),
      //   GetPage(
      //     name: "/search_news",
      //     page: () => SearchNewsView(),
      //     binding: SearchNewsBinding(),
      //   ),
      // ],
      // initialRoute: "/news_headline",
    );
  }
}
