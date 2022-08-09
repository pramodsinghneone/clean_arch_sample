import 'package:clean_architecture_sample_app/src/domain/repositories/remote_api_service.dart';

import '../../core/params/article_request_params.dart';
import '../../core/resources/data_state.dart';
import '../../core/usecases/usecase.dart';
import '../../data/models/breaking_news_response_model.dart';

class GetArticlesUseCase
    implements
        UseCase<DataState<BreakingNewsResponseModel>, ArticlesRequestParams> {
  final RemoteAPIRepository _remoteAPIRepository;

  GetArticlesUseCase(this._remoteAPIRepository);

  @override
  Future<DataState<BreakingNewsResponseModel>> call(
      {ArticlesRequestParams? params}) {
    return _remoteAPIRepository.getBreakingNewsArticles(params!);
  }
}
