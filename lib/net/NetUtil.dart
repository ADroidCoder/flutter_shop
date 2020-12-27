import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';

class NetUtil {
  static final Dio _dio = Dio();

  static dynamic post(String path, {Map data, String authorization}) async {
    try {
      _dio.options.contentType = Headers.jsonContentType;
      var rsp = await _dio.post(path,
          data: data,
          options: Options(headers: {
            Headers.contentTypeHeader: Headers.jsonContentType,
            "Authorization": authorization
          }));
      if (rsp.statusCode == 200) {
        return rsp.data;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  static dynamic postByForm(String path, {Map data, String authorization}) async {
    try {
      _dio.options.contentType = Headers.formUrlEncodedContentType;
      var rsp = await _dio.post(path,
          data: data,
          options: Options(headers: {
            Headers.contentTypeHeader: Headers.formUrlEncodedContentType,
            "Authorization": authorization
          }));
      if (rsp.statusCode == 200) {
        return rsp.data;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  static get(String path, {String authorization}) async {
    try {
      _dio.options.contentType = Headers.jsonContentType;
      var rsp = await _dio.get(path,
          options: Options(headers: {
            Headers.contentTypeHeader: Headers.jsonContentType,
            "Authorization": authorization
          }));
      if (rsp.statusCode == 200) {
        return rsp.data;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;

  }
}
