import 'package:cinemax/core/api_service/api_keys.dart';
import 'package:dio/dio.dart';





class ApiService {

  final Dio _dio;
  final String _baseUrl = 'https://imdb-top-100-movies.p.rapidapi.com/';
  ApiService(this._dio);


  Future get({
    required String urlEndPoint,
    Map<String, dynamic>? queryParameters,
  }) async {
    var response = await _dio.get(
      '$_baseUrl$urlEndPoint',
      options: Options(
        receiveDataWhenStatusError: true,
        headers: {
          'X-RapidAPI-Key': ApiKeys.moviesApiKey,
          'X-RapidAPI-Host': 'imdb-top-100-movies.p.rapidapi.com'
        },
      ),
      queryParameters: queryParameters,
    );
    return response.data;
  }

  // Future<Map<String, dynamic>> post({
  //   required String urlEndPoint,
  //   String? token,
  //   Map<String, dynamic>? queryParameters,
  //   @required Map<String, dynamic>? data,
  //
  // }) async {
  //   var response =await  _dio.post(
  //     '$_baseUrl$urlEndPoint',
  //       options: Options(
  //       headers: {
  //       "lang": lang,
  //       "Content-Type": "application/json",
  //       'Authorization': token ?? '',
  //       },
  //
  //   ),
  //     queryParameters: queryParameters,
  //       data: data,
  //   );
  //   return response.data;
  // }
  //
  // Future<Map<String, dynamic>> put({
  //   required String urlEndPoint,
  //   String? token,
  //   Map<String, dynamic>? data,
  //   Map<String, dynamic>? queryParameters,
  // }) async {
  //   var response = await _dio.put(
  //     '$_baseUrl$urlEndPoint',
  //     options: Options(
  //       receiveDataWhenStatusError: true,
  //       headers: {
  //         "lang": lang,
  //         "Content-Type": "application/json",
  //         'Authorization': token ?? '',
  //       },
  //     ),
  //     queryParameters: queryParameters,
  //     data: data,
  //   );
  //   return response.data;
  // }
  //
  // Future<Map<String, dynamic>> delete({
  //   required String urlEndPoint,
  //   String? token,
  //   Map<String, dynamic>? queryParameters,
  // }) async {
  //   var response = await _dio.delete(
  //     '$_baseUrl$urlEndPoint',
  //     options: Options(
  //       receiveDataWhenStatusError: true,
  //       headers: {
  //         "lang": lang,
  //         "Content-Type": "application/json",
  //         'Authorization': token ?? '',
  //       },
  //     ),
  //     queryParameters: queryParameters,
  //   );
  //   return response.data;
  // }



}
