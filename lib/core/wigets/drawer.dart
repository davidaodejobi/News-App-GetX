import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          ListTile(
            title: const Text('News Headline'),
            onTap: () {
              Get.offNamed('/news_headline');
            },
            leading: const Icon(Icons.contact_page_outlined),
          ),
          ListTile(
            title: const Text('Search News'),
            onTap: () {
              Get.offNamed('/search_news');
            },
            leading: const Icon(Icons.search),
          ),
        ],
      ),
    );
  }
}
