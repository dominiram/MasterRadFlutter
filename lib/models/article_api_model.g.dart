// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArticleApiModel _$ArticleApiModelFromJson(Map<String, dynamic> json) =>
    ArticleApiModel(
      ArticleApiModelSource.fromJson(json['source'] as Map<String, dynamic>),
      json['title'] as String,
      json['description'] as String,
      json['author'] as String,
      json['urlToImage'] as String,
      json['publishedAt'] as String,
      json['content'] as String,
    );

Map<String, dynamic> _$ArticleApiModelToJson(ArticleApiModel instance) =>
    <String, dynamic>{
      'source': instance.source,
      'title': instance.title,
      'description': instance.description,
      'author': instance.author,
      'urlToImage': instance.urlToImage,
      'publishedAt': instance.publishedAt,
      'content': instance.content,
    };

ArticleApiModelSource _$ArticleApiModelSourceFromJson(
        Map<String, dynamic> json) =>
    ArticleApiModelSource(
      json['id'] as String,
      json['name'] as String,
    );

Map<String, dynamic> _$ArticleApiModelSourceToJson(
        ArticleApiModelSource instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
