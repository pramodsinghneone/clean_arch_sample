import 'package:clean_architecture_sample_app/src/domain/usecases/get_articles_usecase.dart';
import 'package:clean_architecture_sample_app/src/injector.dart';
import 'package:clean_architecture_sample_app/src/presentation/blocs/remote_articles/bloc/remote_articles_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocProviders {
  static final List<BlocProvider> providers = [
    BlocProvider<RemoteArticleCubit>(
        create: (_) => RemoteArticleCubit(injector())),
  ];
}
