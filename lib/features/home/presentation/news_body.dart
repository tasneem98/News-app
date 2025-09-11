import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '/core/extensions/string.dart';
import '/features/home/data/model/top_heading_model.dart';

class NewsBody extends StatelessWidget {
  const NewsBody({super.key, required this.article});

  final Articles article;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
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
          _buildArticleImage(
            //! Image for the article provided by the News API
            '${article.urlToImage}',
            screenSize: screenSize.height / 3.5,
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
          _buildAuthorDateRow(
            //! Author of the article
            article.author ?? 'Unknown Author',
            //! Published date in the format MM/DD/YYYY
            date: '${article.publishedAt}'.toDMYDate,
            theme: theme,
            textTheme: textTheme,
          ),
          const Divider(),
          _buildSourceRow(
            //! Source of the article (e.g. TechCrunch)
            article.source!.name ?? 'Unknown Source',
            theme: theme,
            textTheme: textTheme,
          ),
        ],
      ),
    );
  }

  Widget _buildArticleImage(String imageUrl, {required double screenSize}) =>
      SizedBox(
        height: screenSize,
        child: article.urlToImage != null
            ? CachedNetworkImage(
                imageUrl: imageUrl,
                progressIndicatorBuilder: (_, _, progress) => Center(
                  child: CircularProgressIndicator(
                    value: progress.progress,
                  ),
                ),
                errorWidget: (_, _, _) => Image.asset(
                  'assets/images/error_image.png',
                  width: double.infinity,
                  height: 100,
                ),
                fit: BoxFit.fitWidth,
                width: double.infinity,
                alignment: Alignment.topRight,
              )
            : Image.asset(
                'assets/images/error_image.png',
                width: double.infinity,
                height: 100,
              ),
      );

  Widget _buildAuthorDateRow(
    String author, {
    required String date,
    required ThemeData theme,
    required TextTheme textTheme,
  }) => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.center,
    spacing: 10,
    mainAxisSize: MainAxisSize.min,
    children: [
      CircleAvatar(
        backgroundColor: Colors.grey.shade300,
        child: Icon(
          Icons.person,
          color: theme.colorScheme.onPrimaryFixedVariant,
        ),
      ),
      Flexible(
        child: Text(
          author,
          textAlign: TextAlign.right,
          style: textTheme.titleMedium!.copyWith(
            color: theme.colorScheme.onPrimaryFixedVariant,
          ),
          softWrap: true,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
      ),
      const Spacer(),
      Text(
        date,
        textAlign: TextAlign.right,
        style: textTheme.titleMedium!.copyWith(
          color: theme.colorScheme.onPrimaryFixedVariant,
        ),
      ),
    ],
  );

  Widget _buildSourceRow(
    String title, {
    required ThemeData theme,
    required TextTheme textTheme,
  }) => Container(
    margin: const EdgeInsets.symmetric(horizontal: 10),
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(50),
      color: Colors.grey.shade300,
      boxShadow: [
        BoxShadow(color: Colors.grey.shade500, blurRadius: 10),
      ],
    ),

    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      spacing: 10,
      children: [
        Icon(
          Icons.source_sharp,
          color: theme.colorScheme.primary,
          size: 20,
        ),
        Flexible(
          child: Text(
            title,
            textAlign: TextAlign.right,
            style: textTheme.titleMedium!.copyWith(
              color: theme.colorScheme.primary,
            ),
            softWrap: true,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
      ],
    ),
  );
}
