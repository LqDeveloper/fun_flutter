import 'package:dio/dio.dart';

import 'package:dio_utils/dio_utils.dart';

class DioManager {
  static Dio get instance => _dio.dio;
  static late DioRequest _dio;

  static Future initDio() async {
    _dio = await DioRequest.getInstance(
        baseUrl: 'https://www.wanandroid.com/',
        interceptorList: [AuthInterceptor()]);
  }
}

class AuthInterceptor extends InterceptorsWrapper {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    ResponseData responseData = ResponseData.fromJson(response.data);
    if (responseData.success) {
      response.data = responseData.data;
      return handler.next(response);
    } else {
      if (responseData.code == -1001) {
        // 如果cookie过期,需要清除本地存储的登录信息
        // StorageManager.localStorage.deleteItem(UserModel.keyUser);
        throw const UnAuthException(); // 需要登录
      } else {
        throw NotSuccessException.fromRespData(responseData);
      }
    }
  }
}

abstract class BaseResponseData {
  int code = 0;
  String message = "";
  dynamic data;

  bool get success;

  @override
  String toString() {
    return 'BaseRespData{code: $code, message: $message, data: $data}';
  }
}

class ResponseData extends BaseResponseData {
  @override
  bool get success => 0 == code;

  ResponseData.fromJson(Map<String, dynamic> json) {
    code = json['errorCode'];
    message = json['errorMsg'];
    data = json['data'];
  }
}

class NotSuccessException implements Exception {
  String message = "";

  NotSuccessException.fromRespData(BaseResponseData respData) {
    message = respData.message;
  }

  @override
  String toString() {
    return 'NotExpectedException{respData: $message}';
  }
}

class UnAuthException implements Exception {
  const UnAuthException();

  @override
  String toString() => '用于未登录等权限不够,需要跳转授权页面';
}
