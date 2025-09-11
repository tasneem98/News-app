import 'package:flutter/material.dart';

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
