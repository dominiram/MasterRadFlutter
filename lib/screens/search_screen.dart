import 'package:flutter/material.dart';
import 'package:master_rad_flutter/models/article_model.dart';
import 'package:master_rad_flutter/repos/article_repository.dart';
import 'package:master_rad_flutter/screens/screens.dart';
import '../widgets/bottom_nav_bar.dart';
import '../widgets/image_container.dart';

class SearchScreen extends StatelessWidget {
  static const routeName = '/search';

  @override
  Widget build(BuildContext context) {
    List<String> tabs = ['Health', 'Politics', 'Art', 'Food', 'Science'];

    return DefaultTabController(
      initialIndex: 0,
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            automaticallyImplyLeading: false),
        bottomNavigationBar: const BottomNavBar(index: 1),
        body: ListView(
          padding: const EdgeInsets.all(20.0),
          children: [const _DiscoverNews(), _CategoryNews(tabs: tabs)],
        ),
      ),
    );
  }

  const SearchScreen({super.key});
}

class _CategoryNews extends StatelessWidget {
  const _CategoryNews({
    required this.tabs,
  });

  final List<String> tabs;

  @override
  Widget build(BuildContext context) {
    List<Article> articles = <Article>[];
    articles.addAll(ArticleRepository.articles);
    articles.addAll(ArticleRepository.articles);
    return Column(
      children: [
        TabBar(
          isScrollable: true,
          indicatorColor: Colors.black,
          tabs: tabs
              .map(
                (tab) => Tab(
                  icon: Text(
                    tab,
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              )
              .toList(),
        ),
        SizedBox(
          height: 520,
          child: TabBarView(
            children: tabs
                .map(
                  (tab) => ListView.builder(
                    shrinkWrap: true,
                    itemCount: articles.length,
                    itemBuilder: ((context, index) {
                      return _ArticleItem(article: articles[index]);
                    }),
                  ),
                )
                .toList(),
          ),
        )
      ],
    );
  }
}

class _DiscoverNews extends StatelessWidget {
  const _DiscoverNews();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Discover',
          style: Theme.of(context)
              .textTheme
              .headlineMedium!
              .copyWith(color: Colors.black, fontWeight: FontWeight.w900),
        ),
        const SizedBox(height: 5),
        Text(
          'News from all over the world',
          style: Theme.of(context).textTheme.bodySmall,
        ),
        const SizedBox(height: 20),
        TextFormField(
          decoration: InputDecoration(
            hintText: 'Search',
            fillColor: Colors.grey.shade200,
            filled: true,
            prefixIcon: IconButton(
              icon: const Icon(Icons.search, color: Colors.grey),
              onPressed: () {
                //TODO: search!
              },
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: BorderSide.none,
            ),
          ),
        )
      ],
    );
  }
}

class _ArticleItem extends StatelessWidget {
  const _ArticleItem({required this.article});

  final Article article;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          ArticleScreen.routeName,
          arguments: article,
        );
      },
      child: Row(
        children: [
          ImageContainer(
            width: 80,
            height: 80,
            margin: const EdgeInsets.all(10.0),
            borderRadius: 5,
            imageUrl: article.imageUrl,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  article.title,
                  maxLines: 2,
                  overflow: TextOverflow.clip,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Icon(
                      Icons.schedule,
                      size: 18,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      '${DateTime.now().difference(article.createdAt).inHours} hours ago',
                      style: const TextStyle(fontSize: 12),
                    ),
                    const SizedBox(width: 20),
                    const Icon(
                      Icons.visibility,
                      size: 18,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      '${article.views} views',
                      style: const TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
