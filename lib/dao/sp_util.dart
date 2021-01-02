import 'dart:async';
import 'dart:convert';
import 'dart:ffi';

import 'package:flutter_shop/model/token_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SpUtil {
  static SharedPreferences _instance;
  static TokenEntity _token;

  static Completer _completer = Completer();

  static Future _init() async {
    if (!_completer.isCompleted) {
      _instance = await SharedPreferences.getInstance();
      _completer.complete(null);
    }
    return _completer.future;
  }

  static Future<TokenEntity> getToken() async {
    if (null != _token) {
      return _token;
    }
    await _init();

    var jsonStr = _instance.getString("token");
    if (null != jsonStr && jsonStr.isNotEmpty) {
      var json = jsonDecode(jsonStr);
      _token = TokenEntity().fromJson(json);
      return _token;
    }
    return null;
  }

  static saveToken(TokenEntity tokenEntity) async {
    await _init();
    _token = tokenEntity;
    _instance.setString("token", jsonEncode(tokenEntity.toJson()));
  }

  static clearToken() async {
    await _init();
    _instance.setString("token", "");
    _token = null;
  }
}
