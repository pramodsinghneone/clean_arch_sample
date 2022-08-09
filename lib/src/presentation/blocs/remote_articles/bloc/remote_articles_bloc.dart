import 'package:bloc/bloc.dart';
import 'package:clean_architecture_sample_app/src/core/params/article_request_params.dart';
import 'package:clean_architecture_sample_app/src/core/resources/data_state.dart';
import 'package:clean_architecture_sample_app/src/domain/entities/article.dart';
import 'package:clean_architecture_sample_app/src/domain/usecases/get_articles_usecase.dart';
import 'package:equatable/equatable.dart';
import 'remote_articles_state.dart';
part 'remote_articles_event.dart';

class RemoteArticleCubit extends Cubit<RemoteArticlesState> {
  final GetArticlesUseCase getArticlesUseCase;

  RemoteArticleCubit(this.getArticlesUseCase) : super(RemoteArticlesInitial());

  final List<Article> _articles = [];
  int _page = 1;
  static const int _pageSize = 20;

  void getBreakingNews() async {
    emit(const RemoteArticlesLoading());
    final dataState = await getArticlesUseCase(
      params: ArticlesRequestParams(page: _page),
    );

    if (dataState is DataSuccess && dataState.data!.articles!.isNotEmpty) {
      final articles = dataState.data!.articles;
      final noMoreData = articles!.length < _pageSize;
      _articles.addAll(articles);
      _page++;
      emit(RemoteArticlesDone(_articles, noMoreData: noMoreData));
    }
    if (dataState is DataFailed) {
      emit(RemoteArticlesError(dataState.error!));
    }
  }
}


// class RemoteArticlesBloc
//     extends BlocWithState<RemoteArticlesEvent, RemoteArticlesState> {
//   final GetArticlesUseCase _getArticlesUseCase;

//   RemoteArticlesBloc(this._getArticlesUseCase)
//       : super(const RemoteArticlesLoading());

//   final List<Article> _articles = [];
//   int _page = 1;
//   static const int _pageSize = 20;

//   @override
//   Stream<RemoteArticlesState> mapEventToState(
//       RemoteArticlesEvent event) async* {
//     if (event is GetArticles) yield* _getBreakingNewsArticle(event);
//   }

//   Stream<RemoteArticlesState> _getBreakingNewsArticle(
//       RemoteArticlesEvent event) async* {
//     yield* runBlocProcess(() async* {
//       final dataState = await _getArticlesUseCase(
//         params: ArticlesRequestParams(page: _page),
//       );

//       if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
//         final articles = dataState.data;
//         final noMoreData = articles!.length < _pageSize;
//         _articles.addAll(articles);
//         _page++;
//         yield RemoteArticlesDone(_articles, noMoreData: noMoreData);
//       }
//       if (dataState is DataFailed) {
//         yield RemoteArticlesError(dataState.error!);
//       }
//     });
//   }
// }
