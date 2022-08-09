import 'package:clean_architecture_sample_app/src/data/models/breaking_news_response_model.dart';

import '../../core/params/article_request_params.dart';
import '../../core/resources/data_state.dart';

abstract class RemoteAPIRepository {
  Future<DataState<BreakingNewsResponseModel>> getBreakingNewsArticles(
      ArticlesRequestParams? params);
}
