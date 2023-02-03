import 'package:chart_test/core/failure.dart';
import 'package:dio/dio.dart';


abstract class ApiDataSource {
  Future<Response<T>> get<T>({
    Map<String, dynamic>? requestParams,
  });
  Future<Object> post({
    Map<String, dynamic>? data,
    Map<String, dynamic>? requestParams,
  });
}

class ApiDataSourceImpl extends ApiDataSource {
  static const _apiHost = 'https://www.alphavantage.co/query?';
  static const _apiKey = 'CN1BNT5UXJLB1BCY';
  static final _dio = Dio();

  static final Map<String, String> _headers = {
    'accept': 'application/json',
    'Content-Type': 'application/x-www-form-urlencoded',
  };

  final options = Options(
    headers: _headers,
  );

  @override
  Future<Response<T>> get<T>({
    Map<String, dynamic>? requestParams,
  }) async {

    if(requestParams != null){
      requestParams.addAll({'apikey' : _apiKey});
    }

    return await _dioRequest(
      request: () => _dio.get(
        _apiHost,
        queryParameters: requestParams,
        // options: Options(
        //   headers: {
        //     'accept': 'application/json',
        //     'Content-Type': 'application/x-www-form-urlencoded',
        //   },
        // ),
      ),
    );
  }

  @override
  Future<Object> post({
    Map<String, dynamic>? data,
    Map<String, dynamic>? requestParams,
  }) async {
    return await _dioRequest(
      request: () => _dio.post(
        _apiHost,
        data: _convertMapParamsToString(data),
        queryParameters: requestParams,
        options: Options(
          headers: {
            'accept': 'application/json',
            'Content-Type' : 'application/x-www-form-urlencoded',
          },
        ),
      ),
    );
  }

  static Future<Response<T>> _dioRequest<T>({
    required Future<Response<T>> Function() request,
  }) async {
    final Response<T> response = await request();

    if (response.statusCode == 200) {
      return response;
    } else {
      throw const ServerFailure();
    }
  }

  String _convertMapParamsToString(Map<String, dynamic>? data) {
    String requestParamsString = '';
    List<String> dataParams = [];

    if (data != null) {
      for (var item in data.entries) {
        if (item.value is String || item.value is num) {
          String value = '${item.key}=${Uri.encodeComponent(item.value.toString())}';
          dataParams.add(value);
        }
        if (item.value is List<String>) {
          for (String i in item.value) {
            String value = '${item.key}=${Uri.encodeComponent(i)}';
            dataParams.add(value);
          }
        }
      }
    }

    requestParamsString = dataParams.join('&');

    return requestParamsString;
  }
}
