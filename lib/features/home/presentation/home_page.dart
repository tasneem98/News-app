import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/core/extensions/sized_box.dart';
import '/core/extensions/string.dart';
import '/features/home/presentation/news_body.dart';
import '/features/home/presentation/news_search_delegates.dart';
import '/features/home/providers/news_provider.dart';
import '/features/news_details/presentation/news_details_page.dart';

//ToDo:
// 1. load more articles ✔️
// 2. pull to refresh ✔️
// 3. Search in "v2/everything?q=$searchKeyWord" API in new window ✔️
// 4. filter top-headlines by selected-category ✔️
// 5. check internet connection

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage>
    with AutomaticKeepAliveClientMixin {
  Timer? _debounce;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        if (_debounce?.isActive ?? false) {
          _debounce!.cancel();
        }
        _debounce = Timer(const Duration(milliseconds: 500), () {
          if (!ref
              .read(
                topHeadlineNewsProvider(ref.watch(selectedCategoryProvider)),
              )
              .isLoading) {
            ref
                .watch(
                  topHeadlineNewsProvider(
                    ref.watch(selectedCategoryProvider),
                  ).notifier,
                )
                .fetchTopHeadlineNews();
          }
        });
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _debounce!.cancel();
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final screenPadding = MediaQuery.paddingOf(context);
    final screenTheme = Theme.of(context);

    // Selected Category
    final selectedCategory = ref.watch(selectedCategoryProvider);
    final selectedCategoryN = ref.watch(selectedCategoryProvider.notifier);
    final categories = ref.watch(categoriesList);

    // Top Headline News
    final topHeadlineNews = ref.watch(
      topHeadlineNewsProvider(selectedCategory),
    );

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async =>
            ref.refresh(topHeadlineNewsProvider(selectedCategory)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          spacing: 15.0,
          children: [
            Padding(
              padding: EdgeInsetsGeometry.symmetric(
                vertical: screenPadding.top,
              ),
            ),

            //* Search Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GestureDetector(
                onTap: () => showSearch(
                  context: context,
                  delegate: NewsSearch(),
                ),
                child: const TextField(
                  onChanged: null,
                  enabled: false,
                  decoration: InputDecoration(
                    hintText: 'Search',
                    hintStyle: TextStyle(color: Colors.black),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),

            //* Categories Chip
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                height: 50,
                child: ListView.separated(
                  itemCount: categories.length,
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (_, index) => 8.width,
                  itemBuilder: (_, index) => ActionChip(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    label: Text(categories[index].toTitleCase),
                    onPressed: () => selectedCategoryN.update(
                      (_) => categories[index],
                    ),
                    backgroundColor: selectedCategory == categories[index]
                        ? screenTheme.colorScheme.primary.withOpacity(0.9)
                        : screenTheme.colorScheme.onPrimaryContainer,
                    chipAnimationStyle: ChipAnimationStyle(
                      enableAnimation: const AnimationStyle(
                        duration: Duration(seconds: 3),
                        curve: Curves.easeInOut,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            //* Top Headline News List
            Expanded(
              child: topHeadlineNews.when(
                skipLoadingOnRefresh: false,
                error: (e, s) => Center(child: Text(e.toString())),
                loading: () => const Center(child: CircularProgressIndicator()),
                data: (data) => ListView.separated(
                  padding: EdgeInsets.symmetric(vertical: 25),
                  controller: _scrollController,
                  cacheExtent: 50,
                  addAutomaticKeepAlives: true,
                  itemCount: data!.length,
                  separatorBuilder: (_, index) => 16.height,
                  itemBuilder: (_, index) => InkWell(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NewsDetailsPage(
                          newsUrl: '${data[index].url}',
                        ),
                      ),
                    ),
                    child: NewsBody(article: data[index]),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
