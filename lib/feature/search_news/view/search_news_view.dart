// ignore_for_file: unnecessary_null_comparison, prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app_getx/feature/search_news/controller/search_news_controller.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../../description.dart';

class SearchNewsView extends StatelessWidget {
  SearchNewsView({Key? key}) : super(key: key);

  final controller = Get.find<SearchNewsController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 20,
            ),
            child: SearchNewsTextField(controller: controller),
          ),
          Expanded(child: Obx(
            () {
              return controller.isLoading.isTrue
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : controller.articles.isEmpty
                      ? const Center(
                          child: Text('No news found'),
                        )
                      : Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: ListOfSearchedNews(controller: controller),
                        );
            },
          ))
        ],
      ),
    );
  }
}

class ListOfSearchedNews extends StatelessWidget {
  const ListOfSearchedNews({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final SearchNewsController controller;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (ctx, i) {
          return GestureDetector(
            onTap: () {
              Get.to(Description(
                imageUrl: controller.articles[i].urlToImage,
                tag: controller.articles[i].url!,
                author: controller.articles[i].author!,
                content: controller.articles[i].content!,
                title: controller.articles[i].title!,
              ));
            },
            child: Container(
              height: 140,
              margin: const EdgeInsets.symmetric(
                vertical: 20.0 / 2,
              ),
              child: Row(
                children: [
                  SizedBox(
                    child: CachedNetworkImage(
                      imageUrl: controller.articles[i].urlToImage,
                      fit: BoxFit.cover,
                      placeholder: (context, url) =>
                          const Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) => Image.asset(
                        'assets/images/404.jfif',
                        fit: BoxFit.fill,
                      ),
                    ),
                    height: 140,
                    width: 130,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            controller.articles[i].title!,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(
                                    fontSize: 16,
                                    overflow: TextOverflow.ellipsis),
                            maxLines: 4,
                          ),
                          Text('By ${controller.articles[i].author}',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                    color: Colors.grey,
                                  )),
                          Row(
                            children: [
                              Text('World',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                        color: const Color(0xFF69BDFD),
                                      )),
                              const SizedBox(
                                width: 20 / 2,
                              ),
                              WebsafeSvg.asset(
                                'assets/icons/ellipse.svg',
                              ),
                              const SizedBox(
                                width: 20 / 2,
                              ),
                              Text('1m ago',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                        color: Colors.grey,
                                      )),
                              const Spacer(),
                              InkWell(
                                onTap: () {},
                                child: WebsafeSvg.asset(
                                  'assets/icons/menu.svg',
                                  width: 30,
                                ),
                              ),
                            ],
                          ),
                        ]),
                  )
                ],
              ),
            ),
          );
        },
        separatorBuilder: (ctx, i) => const Divider(),
        itemCount: controller.articles.length);
  }
}

class SearchNewsTextField extends StatelessWidget {
  const SearchNewsTextField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final SearchNewsController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller.searchTextController,
      decoration: InputDecoration(
        hintText: 'Search',
        filled: true,
        hintStyle: Theme.of(context).textTheme.bodyText1!.copyWith(
              color: Color(0xFF909090),
              fontSize: 18,
            ),
        fillColor: Color(0xFFEEEEEE),
        prefixIcon: Padding(
          padding: const EdgeInsets.all(20 * 0.75),
          child: WebsafeSvg.asset('assets/icons/search_unselected.svg',
              color: const Color(0xFF909090)),
        ),
        alignLabelWithHint: true,
        suffixIcon: Padding(
          padding: const EdgeInsets.all(20 * 0.75),
          child: WebsafeSvg.asset(
            'assets/icons/cancel.svg',
          ),
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
