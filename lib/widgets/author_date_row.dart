import 'package:flutter/material.dart';
import '/core/extensions/string.dart';

class AuthorDateRow extends StatelessWidget {
  const AuthorDateRow({
    super.key,
    required this.author,
    required this.publishedAt,
  });

  final String author;
  final String publishedAt;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 10,
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          backgroundColor: Colors.grey.shade300,
          child: Icon(
            Icons.person,
            color: Theme.of(
              context,
            ).colorScheme.onPrimaryFixedVariant,
          ),
        ),
        Flexible(
          child: Text(
            //! Author of the article
            author,
            textAlign: TextAlign.right,
            style: TextTheme.of(context).titleMedium!.copyWith(
              color: Theme.of(
                context,
              ).colorScheme.onPrimaryFixedVariant,
            ),
            softWrap: true,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
        const Spacer(),
        Text(
          //! Published date in the format MM/DD/YYYY
          publishedAt.toDMYDate,
          textAlign: TextAlign.right,
          style: TextTheme.of(context).titleMedium!.copyWith(
            color: Theme.of(
              context,
            ).colorScheme.onPrimaryFixedVariant,
          ),
        ),
      ],
    );
  }
}
