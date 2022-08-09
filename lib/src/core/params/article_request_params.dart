import 'package:clean_architecture_sample_app/src/core/utils/constants.dart';

class ArticlesRequestParams {
  final String apiKey;
  final String country;
  final String category;
  final int page;
  final int pageSize;

  const ArticlesRequestParams({
    this.apiKey = kApiKey,
    this.country = 'India',
    this.category = 'General',
    this.page = 1,
    this.pageSize = 20,
  });
}
