import 'package:json_annotation/json_annotation.dart';

part 'article.g.dart';

@JsonSerializable()
class Article {
  Article();

  @JsonKey(name: 'author')
  String? author;

  @JsonKey(name: 'title')
  String? title;

  @JsonKey(name: 'description')
  String? description;

  @JsonKey(name: 'url')
  String? url;

  @JsonKey(name: 'urlToImage')
  String? urlToImage;

  @JsonKey(name: 'publishedAt')
  String? publishedAt;

  @JsonKey(name: 'content')
  String? content;
  // final String? author;
  // final String? title;
  // final String? description;
  // final String? url;
  // final String? urlToImage;
  // final String? publishedAt;
  // final String? content;

  // Article(
  //   this.author,
  //   this.title,
  //   this.description,
  //   this.url,
  //   this.urlToImage,
  //   this.publishedAt,
  //   this.content,
  // );

  factory Article.fromJson(Map<String, dynamic> json) =>
      _$ArticleFromJson(json);
  Map<String, dynamic> toJson() => _$ArticleToJson(this);
}
