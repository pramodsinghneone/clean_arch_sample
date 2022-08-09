import 'package:clean_architecture_sample_app/src/core/params/article_request_params.dart';
import 'package:clean_architecture_sample_app/src/core/resources/data_state.dart';
import 'package:clean_architecture_sample_app/src/domain/entities/article.dart';

import '../../data/models/breaking_news_response_model.dart';

abstract class ArticleRepository {
  Future<DataState<BreakingNewsResponseModel>> getBreakingNewsArticles(
    ArticlesRequestParams params,
  );
}
