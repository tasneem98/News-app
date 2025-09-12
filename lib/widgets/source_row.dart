import 'package:flutter/material.dart';

class SourceRow extends StatelessWidget {
  const SourceRow({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
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
            color: Theme.of(context).colorScheme.primary,
            size: 20,
          ),
          Flexible(
            child: Text(
              title,
              textAlign: TextAlign.right,
              style: TextTheme.of(context).titleMedium!.copyWith(
                color: Theme.of(context).colorScheme.primary,
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
}
