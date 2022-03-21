import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:websafe_svg/websafe_svg.dart';

class Description extends StatelessWidget {
  const Description({
    Key? key,
    required this.imageUrl,
    required this.tag,
    required this.author,
    required this.title,
    required this.content,
  }) : super(key: key);

  final String imageUrl;
  final String tag;
  final String title;
  final String author;
  final String content;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: WebsafeSvg.asset(
            'assets/icons/back.svg',
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: WebsafeSvg.asset(
              'assets/icons/bookmark_unselected.svg',
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: WebsafeSvg.asset(
              'assets/icons/share.svg',
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  fit: BoxFit.cover,
                  placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => Hero(
                    tag: tag,
                    child: Image.asset(
                      'assets/images/404.jfif',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                height: size.height * 0.3,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(overflow: TextOverflow.ellipsis),
                  maxLines: 4,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 25,
                      child: Icon(Icons.person),
                    ),
                    const SizedBox(
                      width: 20 / 2,
                    ),
                    Text(
                        'By ${author.characters.length > 20 ? author.substring(0, 20) + '...' : author}',
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              color: Colors.grey,
                            )),
                    const Spacer(),
                    Text('1m ago',
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              color: Colors.grey,
                            )),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                ),
                child: Text(
                    "$content Sed libero. In ac felis quis tortor malesuada pretium. Morbi vestibulum volutpat enim. Morbi mollis tellus ac sapien. Proin sapien ipsum, porta a, auctor quis, euismod ut, mi Sed libero. In ac felis quis tortor malesuada pretium. Morbi vestibulum volutpat enim. Morbi mollis tellus ac sapien. Proin sapien ipsum, porta a, auctor quis, euismod ut, mi n Sed libero. In ac felis quis tortor malesuada pretium. Morbi vestibulum volutpat enim. Morbi mollis tellus ac sapien. Proin sapien ipsum, porta a, auctor quis, euismod ut, mi Sed libero. In ac felis quis tortor malesuada pretium. Morbi vestibulum volutpat enim. Morbi mollis tellus ac sapien. Proin sapien ipsum, porta a, auctor quis, euismod ut, mi.",
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          fontSize: 18,
                        )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
