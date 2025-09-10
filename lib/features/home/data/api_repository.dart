import '/features/home/data/api_service.dart';
import '/features/home/data/model/top_heading_model.dart';

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
}
