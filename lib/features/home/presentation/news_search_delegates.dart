import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/features/home/providers/news_provider.dart';
import '/features/news_details/presentation/news_details_page.dart';
import '/widgets/author_date_row.dart';

class NewsSearch extends SearchDelegate {
  @override
  String? get searchFieldLabel => 'Search News...';

  @override
  bool get enableSuggestions => false;

  @override
  List<Widget>? buildActions(BuildContext context) {
    // Build the clear button
    return [
      IconButton(
        onPressed: () => query = '',
        icon: const Icon(
          Icons.clear_rounded,
          color: Colors.black,
          size: 28,
        ),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // Build the back button
    return IconButton(
      onPressed: () => close(context, null),
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
        color: Colors.black,
        size: 28,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Build the search results
    if (query.isEmpty) {
      return Center(
        child: Text(
          'What are you looking for?',
          style: TextTheme.of(context).bodyLarge,
          textAlign: TextAlign.center,
        ),
      );
    }
    return Consumer(
      builder: (context, ref, _) {
        final articles = ref.watch(searchNewsProvider(query));
        return articles.when(
          skipLoadingOnReload: false,
          skipError: false,
          skipLoadingOnRefresh: false,
          error: (e, s) => Center(
            child: Text(
              e.toString(),
              style: TextTheme.of(context).bodyLarge,
              textAlign: TextAlign.center,
            ),
          ),
          loading: () => const Center(child: CircularProgressIndicator()),
          data: (data) {
            if (data!.isEmpty) {
              return const Center(child: Text('No result found!'));
            }
            return ListView.builder(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8,
              ),
              itemCount: data.length,
              itemBuilder: (_, index) => Card(
                child: ListTile(
                  horizontalTitleGap: 5.0,
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NewsDetailsPage(
                        newsUrl: '${data[index].url}',
                      ),
                    ),
                  ),

                  title: Text(
                    //! Title of the article
                    '${data[index].title}',
                    style: TextTheme.of(context).titleMedium!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      height: 1.5,
                    ),
                    overflow: TextOverflow.visible,
                    softWrap: true,
                    maxLines: 5,
                  ),
                  subtitle: AuthorDateRow(
                    //! Author of the article
                    author: data[index].author ?? 'Unknown Author',

                    //! Published date in the format MM/DD/YYYY
                    publishedAt: '${data[index].publishedAt}',
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Build the search suggestions
    return Center(
      child: Text(
        'What are you looking for?',
        style: TextTheme.of(context).bodyLarge,
        textAlign: TextAlign.center,
      ),
    );
  }
}
