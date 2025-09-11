import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/core/extensions/sized_box.dart';
import 'package:news_app/features/home/providers/news_provider.dart';
import 'package:news_app/features/news_details/presentation/news_details_page.dart';
import 'package:news_app/widgets/buttons/view_all.dart';
import 'package:news_app/widgets/text_avatar.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenSize = MediaQuery.sizeOf(context);
    final screenPadding = MediaQuery.paddingOf(context);
    final screenTheme = Theme.of(context);
    final screenTextTheme = TextTheme.of(context);

    // Selected Category
    final selectedCategory = ref.watch(selectedCategoryProvider);
    final selectedCategoryN = ref.watch(selectedCategoryProvider.notifier);
    final categories = ref.watch(categoriesList);

    // Top Headline News
    final topHeadlineNews = ref.watch(topHeadlineNewsProvider);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          spacing: 15,
          children: [
            Padding(
              padding: EdgeInsetsGeometry.symmetric(
                vertical: screenPadding.top,
              ),
            ),

            //ToDo: Search Bar
            const TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(Icons.search),
              ),
            ),

            //* Categories Chip
            SizedBox(
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
                  label: Text(categories[index].category),
                  onPressed: () =>
                      selectedCategoryN.update((_) => categories[index]),
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
            12.0.width,

            //* Top Headline News Section
            // ToDo: Top Headline News View All Button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Top Heading',
                  style: screenTextTheme.titleLarge!.copyWith(),
                  textAlign: TextAlign.left,
                ),
                const Spacer(),
                ViewAllButton(
                  onPressed: () {},
                ),
              ],
            ),
            12.0.width,

            //* Top Headline News List
            // /***
            SizedBox(
              height: screenSize.height / 3,
              child: topHeadlineNews.when(
                data: (data) => ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: data!.length,
                  itemBuilder: (_, index) => InkWell(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NewsDetailsPage(
                          newsUrl: '${data[index].url}',
                        ),
                      ),
                    ),
                    child: SizedBox(
                      width: screenSize.width - 100,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        spacing: 10.0,
                        children: [
                          Container(
                            width: screenSize.width - 100,
                            height: screenSize.height / 5,
                            decoration: BoxDecoration(
                              color: screenTheme.colorScheme.outline
                                  .withOpacity(0.2),
                              borderRadius: BorderRadius.circular(35.0),
                              image: DecorationImage(
                                image: NetworkImage(
                                  '${data[index].urlToImage}',
                                ),
                                onError: (_, _) => const AssetImage(
                                  'assets/images/error_image.png',
                                ),
                                filterQuality: FilterQuality.medium,
                                fit: BoxFit.fitHeight,
                                alignment: Alignment.center,
                              ),
                            ),
                            alignment: Alignment.bottomLeft,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),
                            child: TextAvatar(
                              color: screenTheme.colorScheme.onPrimary,
                              title: data[index].source!.name.toString(),
                            ),
                          ),
                          Text(
                            data[index].title.toString(),
                            style: screenTextTheme.titleMedium!.copyWith(
                              color: screenTheme.colorScheme.outline,
                              height: 1.5,
                              overflow: TextOverflow.visible,
                              fontSize: 14,
                            ),
                            overflow: TextOverflow.visible,
                            softWrap: true,
                            maxLines: 5,
                          ),
                          TextAvatar(
                            color:
                                screenTheme.colorScheme.onPrimaryFixedVariant,
                            title: data[index].author.toString(),
                            author: true,
                          ),
                        ],
                      ),
                    ),
                  ),
                  separatorBuilder: (_, index) => 16.width,
                ),
                error: (e, s) => Center(
                  child: Text(e.toString()),
                ),
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
            // ***/

            //ToDo: News List
            //! Source of the article (e.g. TechCrunch)
            //! Author of the article (e.g. Mark Johnson)
            //! Title of the article
            //! Subtitle of the article - this shouldn't exceed 2 lines and should be truncated if it does
            //! Published date in the format MM/DD/YYYY (e.g. 12/02/2020)
            //! Image for the article provided by the News API
          ],
        ),
      ),
    );
  }
}
