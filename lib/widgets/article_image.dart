import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ArticleImage extends StatelessWidget {
  const ArticleImage({super.key, required this.urlToImage});

  final String urlToImage;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);

    return SizedBox(
      height: screenSize.height / 3.5,
      child: urlToImage != 'null'
          ? CachedNetworkImage(
              imageUrl: urlToImage,
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
  }
}
