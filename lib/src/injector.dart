import 'package:clean_architecture_sample_app/src/domain/repositories/remote_api_service.dart';
import 'package:clean_architecture_sample_app/src/data/datasource/remote/remote_api_service_impl.dart';
import 'package:clean_architecture_sample_app/src/domain/repositories/article_repository.dart';
import 'package:clean_architecture_sample_app/src/domain/usecases/get_articles_usecase.dart';
import 'package:clean_architecture_sample_app/src/presentation/blocs/remote_articles/bloc/remote_articles_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final injector = GetIt.instance;

Future<void> initializeDependencies() async {
  // Dio Client
  injector.registerSingleton<Dio>(Dio());

  // Dependencies
  injector.registerSingleton<RemoteAPIRepository>(RemoteAPIServiceImpl());

  // Usecases
  injector
      .registerSingleton<GetArticlesUseCase>(GetArticlesUseCase(injector()));

  // Cubits
  injector
      .registerSingleton<RemoteArticleCubit>(RemoteArticleCubit(injector()));
}
