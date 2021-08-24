import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './toastService.dart';

class WebService {
  factory WebService() {
    return _this;
  }
  static WebService _this = WebService._();

  WebService._() {
    freeDio = Dio();
    freeDio.options.connectTimeout = 20000;
    freeDio.options.baseUrl = _baseURL;

    tokenDio = Dio();
    tokenDio.options.connectTimeout = 20000;
    tokenDio.options.baseUrl = _baseURL;
    initializeInterceptors();
  }

  late Dio freeDio;
  late Dio tokenDio;
  String _baseURL = "https://api-dev.shopbox.com/";
  String? mytoken;
  String? myrt;
  final String storageKeyMobileToken = "accessToken";

  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  /// ----------------------------------------------------------
  /// Method that returns the token from Shared Preferences
  /// ----------------------------------------------------------

  Future<String?> getMobileToken() async {
    final SharedPreferences prefs = await _prefs;

    return prefs.getString(storageKeyMobileToken) ?? null;
  }

  /// ----------------------------------------------------------
  /// Method that saves the token in Shared Preferences
  /// ----------------------------------------------------------

  Future<bool> setMobileToken(String token) async {
    mytoken = token;

    final SharedPreferences prefs = await _prefs;
    if (token == null) {
      return prefs.remove(storageKeyMobileToken);
    } else {
      return prefs.setString(storageKeyMobileToken, token);
    }
  }

  /// ----------------------------------------------------------
  /// initialize tokens
  /// ----------------------------------------------------------

  Future<void> initializeToken() async {
    mytoken = await getMobileToken();
    return;
  }

  initializeInterceptors() {
    tokenDio.interceptors.clear();
    freeDio.interceptors.clear();
    freeDio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          // Do something before request is sent
          print('send request：path:${options.path}，baseURL:${options.baseUrl}');
          print('headers: ${options.headers}');
          print('data: ${options.data}');

          return handler.next(options); //continue
          // If you want to resolve the request with some custom data，
          // you can return a `Response` object or return `dio.resolve(data)`.
          // If you want to reject the request with a error message,
          // you can return a `DioError` object or return `dio.reject(errMsg)`
        },
        onResponse: (response, handler) {
          print('status code: ${response.statusCode}');
          print('data: ${response.data}');

          // Do something with response data

          return handler.next(response); // continue
        },
        onError: (DioError e, handler) {
          print('error');
          print(e.response);
          print(e.response?.statusCode);
          print(e.type.toString());
          return handler.next(e);
        },
      ),
    );
    tokenDio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          
          // Do something before request is sent
          options.queryParameters[storageKeyMobileToken] = mytoken;

          print('send request：path:${options.path}，baseURL:${options.baseUrl}');
          print('headers: ${options.headers}');
          print('data: ${options.data}');

          return handler.next(options); //continue
          // If you want to resolve the request with some custom data，
          // you can return a `Response` object or return `dio.resolve(data)`.
          // If you want to reject the request with a error message,
          // you can return a `DioError` object or return `dio.reject(errMsg)`
        },
        onResponse: (response, handler) {
          print('status code: ${response.statusCode}');
          print('data: ${response.data}');
          // Do something with response data

          return handler.next(response); // continue
        },
        onError: (DioError e, handler) async {
          print('error');
          print(e.response);
          print(e.response?.statusCode);
          return handler.next(e);
        },
      ),
    );
  }
}
