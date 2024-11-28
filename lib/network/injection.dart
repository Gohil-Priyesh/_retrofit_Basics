
import 'package:dio/dio.dart';
import 'package:flutter/rendering.dart';
import 'package:retrofit_basic_exp/network/api_services.dart';

/// dio initialization
// final restClient = RestClient(Dio());

final restClient = RestClient(baseUrl: "",dio);

final dio = getDio();

Dio getDio(){
 BaseOptions options = BaseOptions(
   receiveDataWhenStatusError: true,
   contentType: "application/json",
   sendTimeout: const Duration(seconds: 30),
   connectTimeout: const Duration(seconds: 30),
   receiveTimeout: const Duration(seconds: 30),
 );

  Dio dio = Dio(options);
  dio.interceptors.add(LogInterceptor());
  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (request, handler){
        debugPrint('Api Request Body: ${request.data}');
        return handler.next(request);
      },

      onResponse: (Response response, ResponseInterceptorHandler handler){
        debugPrint('Api Response: ${response.data}');
        return handler.next(response);
      },

      onError: (DioException e, handler){
        final response = e.response;
        debugPrint('Api Error --> statusCode: ${response?.statusCode} --> ${response?.statusMessage} : Error ==> ${e.toString()}');
        return handler.next(e);
      }
    )
  );
  return dio;
}