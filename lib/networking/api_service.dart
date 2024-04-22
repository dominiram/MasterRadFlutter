import 'package:master_rad_flutter/models/article_api_model.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: 'https://newsapi.org/v2/')
abstract class ApiService {
  static String apiKey = "f4e60dfb5a8743c0b40dc6e40ce68b60";

  factory ApiService(Dio dio) = _ApiService;

  @GET('everything')
  Future<List<ArticleApiModel>> getNews();
}
