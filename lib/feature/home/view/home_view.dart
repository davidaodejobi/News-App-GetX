import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app_getx/feature/description.dart';
import 'package:news_app_getx/feature/news_headline/controller/news_headline_controller.dart';
import 'package:websafe_svg/websafe_svg.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  final controller = Get.find<NewsHeadlineController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 20.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  WebsafeSvg.asset(
                    'assets/icons/newsLogo 1.svg',
                    width: 30,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'News 24',
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Wrap(
              spacing: 10,
              children: const [
                Chip(
                  label: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: Text('Top'),
                  ),
                ),
                Chip(
                  label: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: Text('World'),
                  ),
                ),
                Chip(
                  label: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: Text('Politics'),
                  ),
                ),
                Chip(
                  label: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: Text('Entertainment'),
                  ),
                ),
                Chip(
                  label: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: Text('Sport'),
                  ),
                ),
                Chip(
                  label: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: Text('Sport'),
                  ),
                ),
              ],
            ),
            // const SizedBox(
            //   height: 10,
            // ),
            Expanded(
              child: Obx(() {
                if (controller.isLoading.isTrue) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return ListOfHeadLineNews(controller: controller);
                }
              }),
            )
          ],
        ),
      ),
    );
  }
}

class ListOfHeadLineNews extends StatelessWidget {
  const ListOfHeadLineNews({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final NewsHeadlineController controller;

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
                      errorWidget: (context, url, error) => Hero(
                        tag: controller.articles[i].url!,
                        child: Image.asset(
                          'assets/images/404.jfif',
                          fit: BoxFit.fill,
                        ),
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
