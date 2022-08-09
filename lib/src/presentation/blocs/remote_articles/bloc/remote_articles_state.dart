import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../../../../domain/entities/article.dart';

abstract class RemoteArticlesState extends Equatable {
  final List<Article>? articles;
  final bool? noMoreData;
  final DioError? error;
  const RemoteArticlesState({
    this.articles,
    this.error,
    this.noMoreData,
  });

  @override
  List<Object> get props => [articles!, noMoreData!, error!];
}

class RemoteArticlesInitial extends RemoteArticlesState {}

class RemoteArticlesLoading extends RemoteArticlesState {
  const RemoteArticlesLoading();
}

class RemoteArticlesDone extends RemoteArticlesState {
  const RemoteArticlesDone(List<Article> articles, {bool? noMoreData})
      : super(
          articles: articles,
          noMoreData: noMoreData,
        );
}

class RemoteArticlesError extends RemoteArticlesState {
  const RemoteArticlesError(DioError error) : super(error: error);
}
