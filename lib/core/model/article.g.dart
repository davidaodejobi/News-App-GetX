// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Article _$ArticleFromJson(Map<String, dynamic> json) => Article(
      json['author'] as String?,
      json['title'] as String?,
      json['description'] ?? '',
      json['url'] as String?,
      json['urlToImage'] ?? '',
      json['publishedAt'] as String?,
      json['content'] as String?,
    );

Map<String, dynamic> _$ArticleToJson(Article instance) => <String, dynamic>{
      'author': instance.author,
      'title': instance.title,
      'description': instance.description,
      'url': instance.url,
      'urlToImage': instance.urlToImage,
      'publishedAt': instance.publishedAt,
      'content': instance.content,
    };
