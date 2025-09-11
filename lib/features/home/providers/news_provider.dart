import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/core/network/dio_client.dart';
import 'package:news_app/features/home/data/model/top_heading_model.dart';
import 'package:news_app/features/home/data/top_headline_repository.dart';
import 'package:news_app/features/home/data/top_headline_service.dart';
import 'package:news_app/features/home/providers/news_notifier.dart';

//* News Categories List
final categoriesList = Provider<List<String>>(
  (ref) => [
    "general",
    "business",
    "entertainment",
    "health",
    "science",
    "sports",
    "technology",
  ],
);

final selectedCategoryProvider = StateProvider<String>(
  (ref) => ref.watch(categoriesList).first,
);

//* Top Headline News
final dioClientProvider = Provider<DioClient>((ref) => DioClient());

final apiServiceProvider = Provider<ApiService>(
  (ref) => ApiService(ref.read(dioClientProvider)),
);

final apiRepositoryProvider = Provider<ApiRepository>(
  (ref) => ApiRepository(ref.read(apiServiceProvider)),
);

final topHeadlineNewsProvider = StateNotifierProvider.autoDispose
    .family<NewsNotifier, AsyncValue<List<Articles>?>, String>(
      (ref, category) =>
          NewsNotifier(ref.watch(apiRepositoryProvider), category),
    );

//ToDo // Provider for fetching news by category

//ToDo // Provider for fetching search news by keyword
