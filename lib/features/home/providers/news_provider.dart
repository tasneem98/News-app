import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/core/network/dio_client.dart';
import 'package:news_app/features/home/data/model/news_category.dart';
import 'package:news_app/features/home/data/model/top_heading_model.dart';
import 'package:news_app/features/home/data/top_headline_repository.dart';
import 'package:news_app/features/home/data/top_headline_service.dart';
import 'package:news_app/features/home/providers/news_notifier.dart';

final dioClientProvider = Provider<DioClient>((ref) => DioClient());

final apiServiceProvider = Provider<ApiService>(
  (ref) => ApiService(ref.read(dioClientProvider)),
);

final apiRepositoryProvider = Provider<ApiRepository>(
  (ref) => ApiRepository(ref.read(apiServiceProvider)),
);

final topHeadlineNewsProvider =
    StateNotifierProvider<NewsNotifier, AsyncValue<List<Articles>?>>(
      (ref) => NewsNotifier(ref.watch(apiRepositoryProvider)),
    );

// News Categories List
final categoriesList = Provider<List<NewsCategory>>(
  (ref) => [
    NewsCategory(category: "General", key: "general"),
    NewsCategory(category: "Business", key: "business"),
    NewsCategory(category: "Entertainment", key: "entertainment"),
    NewsCategory(category: "Health", key: "health"),
    NewsCategory(category: "Science", key: "science"),
    NewsCategory(category: "Sports", key: "sports"),
    NewsCategory(category: "Technology", key: "technology"),
  ],
);

final selectedCategoryProvider = StateProvider<NewsCategory>(
  (ref) => ref.watch(categoriesList).first,
);

//ToDo // Provider for fetching news by category
// final newsByCategoryProvider = StateNotifierProvider<NewsNotifier, AsyncValue<List<Articles>?>>((ref) => NewsNotifier(ref.watch(apiRepositoryProvider)));
