import 'package:json_annotation/json_annotation.dart';

import 'article.dart';

part 'news_response.g.dart';

//another method of acheiving the same result
@JsonSerializable(explicitToJson: true)
class NewsResponse {
  NewsResponse();

  @JsonKey(name: 'status')
  String? status;

  @JsonKey(name: 'totalResults')
  int? totalResults;

  @JsonKey(name: 'articles')
  List<Article>? articles;

  factory NewsResponse.fromJson(Map<String, dynamic> json) =>
      _$NewsResponseFromJson(json);
  Map<String, dynamic> toJson() => _$NewsResponseToJson(this);
}
