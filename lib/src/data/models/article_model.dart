import 'package:clean_architecture_sample_app/src/domain/entities/article.dart';

import 'source_model.dart';

class ArticleMode extends Article {
  const ArticleMode({
    final int? id,
    final SourceModel? source,
    final String? author,
    final String? title,
    final String? description,
    final String? url,
    final String? urlToImage,
    final String? publishedAt,
    final String? content,
  }) : super(
          author: author,
          content: content,
          description: description,
          publishedAt: publishedAt,
          source: source,
          title: title,
          url: url,
          urlToImage: urlToImage,
          id: id,
        );

  factory ArticleMode.fromJson(Map<String, dynamic> map) {
    return ArticleMode(
      source: SourceModel.fromJson(map['source'] as Map<String, dynamic>),
      author: map['author'] as String,
      title: map['title'] as String,
      description: map['description'] as String,
      url: map['url'] as String,
      urlToImage: map['urlToImage'] as String,
      publishedAt: map['publishedAt'] as String,
      content: map['content'] as String,
    );
  }
}
