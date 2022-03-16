// ignore_for_file: unnecessary_null_comparison

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app_getx/core/wigets/drawer.dart';

import '../controller/news_headline_controller.dart';

class NewsHeadlineView extends StatelessWidget {
  NewsHeadlineView({Key? key}) : super(key: key);

  final controller = Get.find<NewsHeadlineController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News Headline'),
      ),
      drawer: const SideDrawer(),
      body: Obx(
        () {
          if (controller.isLoading.isTrue) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.separated(
                itemBuilder: (ctx, index) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        controller.articles[index].urlToImage == null
                            ? Container()
                            : CachedNetworkImage(
                                imageUrl: controller.articles[index].urlToImage,
                                placeholder: (context, url) => const Center(
                                    child: CircularProgressIndicator()),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              ),
                        const SizedBox(height: 10),
                        Text(
                          controller.articles[index].title!,
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          // ignore: prefer_if_null_operators
                          controller.articles[index].description == null
                              ? 'There is no description'
                              : controller.articles[index].description,
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ],
                    ),
                separatorBuilder: (ctx, index) => const Divider(),
                itemCount: controller.articles.length);
          }
        },
      ),
    );
  }
}
