import '/features/home/data/model/top_heading_model.dart';
import '/features/home/data/top_headline_service.dart';

class ApiRepository {
  final ApiService _apiService;

  ApiRepository(this._apiService);

  Future<TopHeadingModel> fetchTopHeadlineNews({
    required int page,
    String category = 'general',
    String country = 'us',
  }) async => _apiService.getTopHeadline(
    page: page,
    category: category,
    country: country,
  );

  Future<TopHeadingModel> searchEverything({
    required String keyword,
    String language = 'en',
  }) async =>
      _apiService.searchEverything(keyword: keyword, language: language);
}
