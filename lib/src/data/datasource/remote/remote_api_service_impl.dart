import 'dart:convert';

import 'package:clean_architecture_sample_app/src/core/resources/data_state.dart';
import 'package:clean_architecture_sample_app/src/domain/repositories/remote_api_service.dart';
import 'package:clean_architecture_sample_app/src/data/models/breaking_news_response_model.dart';
import 'package:dio/dio.dart';

import '../../../core/params/article_request_params.dart';

class RemoteAPIServiceImpl extends RemoteAPIRepository {
  @override
  Future<DataState<BreakingNewsResponseModel>> getBreakingNewsArticles(
      ArticlesRequestParams? params) async {
    try {
      final result =
          await Dio().get("https://flutter_bloc_series/getUserDetails");
      if (result.statusCode == 200) {
        return DataSuccess(
            BreakingNewsResponseModel.fromJson(json.decode(result.data)));
      } else {
        return DataFailed(DioError(
          requestOptions: result.requestOptions,
          error: result.statusMessage,
          response: result,
          type: DioErrorType.response,
        ));
      }
    } on DioError catch (e) {
      return DataFailed(e);
    }
  }
}
