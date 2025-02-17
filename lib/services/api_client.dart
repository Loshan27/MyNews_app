// lib/api_client.dart
import 'package:dio/dio.dart';

class ApiClient {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: 'https://newsapi.org/v2/',
    headers: {'Authorization': 'Bearer 092cd6237e464242a7056b3c35b97a97'},
  ));

  Future<Response> getTopHeadlines({required String category}) async {
    return await _dio.get(
      'top-headlines',
      queryParameters: {
        'country': 'us',
        'category': category,
      },
    );
  }

  Future<Response> getPopularNews({required String category}) async {
    return await _dio.get(
      'everything',
      queryParameters: {
        'q': category,
        'sortBy': 'popularity',
      },
    );
  }

  Future<Response> getLatestNews({required String category}) async {
    return await _dio.get(
      'everything',
      queryParameters: {
        'q': category,
        'sortBy': 'publishedAt',
      },
    );
  }

  Future<Response> getSearchNews({required String searchQuery}) async {
    return await _dio.get(
      'everything',
      queryParameters: {
        'q': searchQuery,
        'sortBy': 'publishedAt',
      },
    );
  }

  Future<Response> getNewsSources() async {
    return await _dio.get('sources');
  }
}
