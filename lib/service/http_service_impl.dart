// ignore_for_file: avoid_print
import 'package:dio/dio.dart';
import 'package:news_app_getx/service/http_service.dart';

import 'api_key.dart';

const baseUrl = 'https://newsapi.org/v2/';

class HttpServiceImpl implements HttpService {
  Dio? _dio;

  @override
  Future<Response> getRequest(String url) async {
    Response response;

    try {
      response = await _dio!.get(url);
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }
    return response;
  }

  initializeInterceptors() {
    _dio!.interceptors.add(InterceptorsWrapper(
      onError: (error, handler) {
        print(error.message);
      },
      onRequest: (request, handler) {
        print('Request: ${request.method} ${request.path}');
      },
      onResponse: (response, handler) {
        print(
            'Response: ${response.statusCode} ${response.statusMessage} ${response.data}');
      },
    ));
  }

  @override
  void init() {
    _dio = Dio(BaseOptions(baseUrl: baseUrl, headers: {
      'Authorization': 'Bearer $apiKey',
    }));
  }
}
