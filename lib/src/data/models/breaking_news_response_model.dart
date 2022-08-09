import 'package:clean_architecture_sample_app/src/data/models/article_model.dart';

class BreakingNewsResponseModel {
  final String? status;
  final int? totalResults;
  final List<ArticleMode>? articles;

  BreakingNewsResponseModel({this.articles, this.status, this.totalResults});

  factory BreakingNewsResponseModel.fromJson(Map<String, dynamic> json) {
    return BreakingNewsResponseModel(
      status: json['status'] as String,
      totalResults: json['totalResults'] as int,
      articles: List<ArticleMode>.from(
        (json['articles'] as List<dynamic>).map(
          (e) => ArticleMode.fromJson(e as Map<String, dynamic>),
        ),
      ),
    );
  }
}
