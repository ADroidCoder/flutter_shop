import 'dart:convert';

import 'package:flutter_shop/dao/SpUtil.dart';
import 'package:flutter_shop/model/token_entity.dart';
import 'package:flutter_shop/model/user_entity.dart';
import 'package:flutter_shop/net/NetUtil.dart';

import 'Config.dart';

class LoginDao {
  static Future<bool> register(User user) async {
    final String clientCredentials =
        const Base64Encoder().convert("$ClientID:".codeUnits);
    var data = await NetUtil.post(RegisterUrl,
        data: user.toJson(), authorization: "Basic $clientCredentials");
    return data != null;
  }

  static Future<TokenEntity> login(User user) async {
    var jsonData = user.toJson();
    jsonData["grant_type"] = "password";
    final String clientCredentials =
        const Base64Encoder().convert("$ClientID:".codeUnits);
    var data = await NetUtil.postByForm(LoginUrl,
        data: jsonData, authorization: "Basic $clientCredentials");

    return data != null ? TokenEntity().fromJson(data) : data;
  }

  static Future<User> getProfile() async {
    TokenEntity token = await SpUtil.getToken() ?? "";
    var data = await NetUtil.get(ProfileUrl,
        authorization: "Bearer ${token.accessToken}");
    return data != null ? User().fromJson(data) : data;
  }
}
