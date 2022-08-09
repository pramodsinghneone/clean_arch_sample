import 'package:clean_architecture_sample_app/src/domain/entities/source.dart';
import 'package:equatable/equatable.dart';

class Article extends Equatable {
  final int? id;
  final Source? source;
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final String? publishedAt;
  final String? content;

  const Article({
    this.author,
    this.content,
    this.description,
    this.publishedAt,
    this.source,
    this.title,
    this.url,
    this.urlToImage,
    this.id,
  });

  @override
  List<Object?> get props {
    return [
      author,
      content,
      description,
      publishedAt,
      source,
      title,
      url,
      urlToImage,
      id,
    ];
  }

  @override
  bool? get stringify => true;
}
