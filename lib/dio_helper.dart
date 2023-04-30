import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://dummy.restapiexample.com/',
        receiveDataWhenStatusError: true,
        
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    dio.options.headers = {
      'Authorization': 'Bearer $token',
    };
    DioCacheManager dioCacheManager = DioCacheManager(CacheConfig());
    Options myOptions = buildCacheOptions(Duration(
      days: 30
    ),forceRefresh: true);
dio.interceptors.add(dioCacheManager.interceptor);
    return await dio.get(
      url,
      queryParameters: query ,
      options: myOptions,
    );
  }

  static Future<Response> postData({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
    String? token,
  }) async {

    dio.options.headers = {

      'Authorization':  'Bearer $token',
      'Accept':'application/json',

    };

    return dio.post(
      url,
      queryParameters: query,
      data: data,
    );
  }


  static Future<Response> putData({
    required String url,

    Map<String, dynamic>? query,
    String? token,
  }) async {

    dio.options.headers = {

      'Authorization':  'Bearer $token',
      'Accept':'application/json',
      'method':'put'

    };

    return dio.put(
      url,
      queryParameters: query,
    );
  }

  static Future<Response> deleteData({
    required String url,
    required String token
  }) async {

    dio.options.headers = {

      'Authorization':  'Bearer $token',
      'Accept':'application/json',

    };
    return dio.delete(
      url,

    );
  }
}

