import 'package:json_annotation/json_annotation.dart';

part 'article_api_model.g.dart';

@JsonSerializable()
class ArticleApiModel {
  ArticleApiModelSource source;
  String title;
  String description;
  String author;
  String urlToImage;
  String publishedAt;
  String content;

  ArticleApiModel(this.source, this.title, this.description, this.author,
      this.urlToImage, this.publishedAt, this.content);

  factory ArticleApiModel.fromJson(Map<String, dynamic> json) =>
      _$ArticleApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleApiModelToJson(this);
}

@JsonSerializable()
class ArticleApiModelSource {
  String id;
  String name;

  ArticleApiModelSource(this.id, this.name);

  factory ArticleApiModelSource.fromJson(Map<String, dynamic> json) =>
      _$ArticleApiModelSourceFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleApiModelSourceToJson(this);
}
