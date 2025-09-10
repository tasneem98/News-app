import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/features/home/data/api_repository.dart';
import 'package:news_app/features/home/data/model/top_heading_model.dart';

class NewsNotifier extends StateNotifier<AsyncValue<List<Articles>?>> {
  final ApiRepository _apiRepository;

  int _page = 1;

  bool _isLoading = false;

  NewsNotifier(this._apiRepository) : super(const AsyncValue.loading()) {
    fetchTopHeadlineNews();
  }

  Future<void> fetchTopHeadlineNews() async {
    if (_isLoading) return;
    _isLoading = true;

    try {
      state = await AsyncValue.guard(() async {
        final result = await _apiRepository.fetchTopHeadlineNews(
          page: _page,
        );

        final resultArticles = result.articles;
        if (resultArticles == null) {
          return [];
        }

        return [...resultArticles];
      });
    } on Exception catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    } finally {
      _isLoading = false;
    }
  }

  /*
  Future<void> fetchTopHeadlineNews() async {
    if (_isLoading) return;
    _isLoading = true;

    try {
      final currentTopHeadlines = state.valueOrNull ?? [];

      state = await AsyncValue.guard(() async {
        final result = await _apiRepository.fetchTopHeadlineNews(
          page: _page,
        );

        final newArticles = result.articles;
        if (newArticles == null) {
          return [...currentTopHeadlines];
        }
        _page++;

        return [...currentTopHeadlines, ...newArticles];
      });
    } on Exception catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    } finally {
      _isLoading = false;
    }
  }
*/
}
