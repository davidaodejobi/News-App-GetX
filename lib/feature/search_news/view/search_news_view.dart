import 'package:flutter/material.dart';

import '../../../core/wigets/drawer.dart';

class SearchNewsView extends StatelessWidget {
  const SearchNewsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search News'),
      ),
      drawer: const SideDrawer(),
      body: const Center(
        child: Text('Search News'),
      ),
    );
  }
}
