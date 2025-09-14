import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/features/home/data/model/top_heading_model.dart';
import '/features/home/data/top_headline_repository.dart';

class NewsNotifier extends StateNotifier<AsyncValue<List<Articles>?>> {
  final String category;
  final ApiRepository _apiRepository;

  int _page = 1;

  bool _isLoading = false;

  NewsNotifier(this._apiRepository, this.category)
    : super(const AsyncValue.loading()) {
    fetchTopHeadlineNews();
  }

  // Fetch Top Headline News
  Future<void> fetchTopHeadlineNews() async {
    if (_isLoading) return;
    _isLoading = true;

    try {
      final currentArticles = state.valueOrNull ?? [];
      state = await AsyncValue.guard(() async {
        final result = await _apiRepository.fetchTopHeadlineNews(
          page: _page,
          category: category,
        );

        final newArticles = result.articles;
        if (newArticles == null) {
          return [...currentArticles];
        }

        _page++;

        return [...currentArticles, ...newArticles];
      });
    } on Exception catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    } finally {
      _isLoading = false;
    }
  }
}
