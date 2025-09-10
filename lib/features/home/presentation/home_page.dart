import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/core/extensions/sized_box.dart';
import 'package:news_app/features/home/providers/news_provider.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenSize = MediaQuery.sizeOf(context);
    final screenPadding = MediaQuery.paddingOf(context);
    final screenTheme = Theme.of(context);
    final screenTextTheme = TextTheme.of(context);

    // Selected Category
    final _selectedCategory = ref.watch(selectedCategoryProvider);
    final _selectedCategoryN = ref.watch(selectedCategoryProvider.notifier);
    final _categoriesList = ref.watch(categoriesList);

    // Top Headline News
    final _topHeadlineNews = ref.watch(topHeadlineNewsProvider);

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
                prefixIcon: const Icon(Icons.search),
              ),
            ),

            //* Categories Chip
            SizedBox(
              height: 50,
              child: ListView.separated(
                itemCount: _categoriesList.length,
                scrollDirection: Axis.horizontal,
                separatorBuilder: (_, index) => 8.width,
                itemBuilder: (_, index) => ActionChip(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  label: Text(_categoriesList[index].category),
                  onPressed: () =>
                      _selectedCategoryN.update((_) => _categoriesList[index]),
                  backgroundColor: _selectedCategory == _categoriesList[index]
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
            SizedBox(
              height: screenSize.height / 3,
              child: _topHeadlineNews.when(
                data: (data) => ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: data!.length,
                  itemBuilder: (_, index) => InkWell(
                    //ToDo: Navigate to News Details Page
                    onTap: () {},
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

            //   height: screenSize.height / 2.5,
            //   padding: const EdgeInsets.all(16),
            //   child: Column(
            //     mainAxisAlignment: MainAxisAlignment.end,
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     spacing: 15,
            //     children: [
            //       // Title of the article
            //       // Author of the article (e.g. Mark Johnson)
            //       Row(
            //         mainAxisAlignment: MainAxisAlignment.start,
            //         crossAxisAlignment: CrossAxisAlignment.center,
            //         spacing: 5,
            //         children: [
            //           CircleAvatar(
            //             backgroundColor:
            //                 screenTheme.colorScheme.onPrimaryContainer,
            //             radius: 10,
            //           ),
            //           Text(
            //             "Gregory Svirnovskiy",
            //             style: screenTextTheme.bodyMedium!.copyWith(
            //               color: screenTheme.colorScheme.onPrimaryContainer,
            //               fontWeight: FontWeight.w700,
            //               overflow: TextOverflow.visible,
            //             ),
            //             maxLines: 2,
            //           ),
            //           const Spacer(),
            //           Text(
            //             DateTime.parse(
            //               "2025-09-06T18:00:17Z",
            //             ).differenceFromNow,
            //             style: screenTextTheme.bodyMedium!.copyWith(
            //               color: screenTheme.colorScheme.onPrimaryContainer,
            //               fontWeight: FontWeight.w700,
            //               overflow: TextOverflow.visible,
            //             ),
            //             maxLines: 2,
            //           ),
            //         ],
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

class ViewAllButton extends StatelessWidget {
  const ViewAllButton({super.key, required this.onPressed});

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.grey.shade200,
        foregroundColor: Colors.grey.shade600,
        elevation: 0.0,
        textStyle: const TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 16,
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
      ),
      onPressed: onPressed,
      child: const Text('View All'),
    );
  }
}

class TextAvatar extends StatelessWidget {
  TextAvatar({
    super.key,
    required this.color,
    required this.title,
    this.author = false,
  });

  final Color color;
  final String title;
  bool author;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 10,
      children: [
        CircleAvatar(
          backgroundColor: author ? Colors.transparent : color,
          radius: 10,
          child: author ? Icon(Icons.person, color: color) : null,
        ),
        Flexible(
          child: Text(
            title.toString(),
            textAlign: TextAlign.right,
            style: TextTheme.of(
              context,
            ).titleMedium!.copyWith(color: color),
            softWrap: true,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
      ],
    );
  }
}
