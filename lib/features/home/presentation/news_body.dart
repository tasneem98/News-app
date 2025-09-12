import 'package:flutter/material.dart';
import 'package:news_app/widgets/article_image.dart';
import 'package:news_app/widgets/source_row.dart';

import '/features/home/data/model/top_heading_model.dart';
import '/widgets/autor_date_row.dart';

class NewsBody extends StatelessWidget {
  const NewsBody({super.key, required this.article});

  final Articles article;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.onPrimary,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        spacing: 10.0,
        children: [
          ArticleImage(
            //! Image for the article provided by the News API
            urlToImage: '${article.urlToImage}',
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              //! Title of the article
              '${article.title}',
              style: textTheme.titleMedium!.copyWith(
                color: theme.colorScheme.primary,
                height: 1.5,
              ),
              overflow: TextOverflow.visible,
              softWrap: true,
              maxLines: 5,
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Flexible(
              child: Text(
                //! Subtitle of the article - this shouldn't exceed 2 lines and should be truncated if it does
                article.content ??
                    article.description ??
                    'No description available',
                textAlign: TextAlign.start,
                style: textTheme.titleMedium!.copyWith(
                  color: theme.colorScheme.outline,
                ),
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
          ),
          AuthorDateRow(
            //! Author of the article
            author: article.author ?? 'Unknown Author',
            //! Published date in the format MM/DD/YYYY
            publishedAt: '${article.publishedAt}',
          ),
          const Divider(),
          SourceRow(
            //! Source of the article (e.g. TechCrunch)
            title: article.source!.name ?? 'Unknown Source',
          ),
        ],
      ),
    );
  }
}
