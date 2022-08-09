import 'package:clean_architecture_sample_app/src/presentation/blocs/remote_articles/bloc/remote_articles_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/remote_articles/bloc/remote_articles_state.dart';

class BreakingNewsView extends StatefulWidget {
  const BreakingNewsView({Key? key}) : super(key: key);

  @override
  State<BreakingNewsView> createState() => _BreakingNewsViewState();
}

class _BreakingNewsViewState extends State<BreakingNewsView> {
  @override
  void initState() {
    super.initState();

    callAPI();
  }

  callAPI() {
    BlocProvider.of<RemoteArticleCubit>(context).getBreakingNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _body(),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: const Text("Daily News"),
      actions: [
        Builder(
            builder: (context) => InkWell(
                  onTap: () {},
                  child: Icon(Icons.bookmark),
                )),
      ],
    );
  }

  Widget _body() {
    return BlocBuilder<RemoteArticleCubit, RemoteArticlesState>(
      builder: (_, state) {
        if (state is RemoteArticlesLoading) {
          return const Center(child: CupertinoActivityIndicator());
        }
        if (state is RemoteArticlesError) {
          return const Center(child: Icon(Icons.refresh));
        }
        if (state is RemoteArticlesDone) {
          return const Text("Data Found");
        }
        return const SizedBox();
      },
    );
  }
}
