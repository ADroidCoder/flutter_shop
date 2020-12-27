import 'package:flutter_shop/model/token_entity.dart';

tokenEntityFromJson(TokenEntity data, Map<String, dynamic> json) {
	if (json['access_token'] != null) {
		data.accessToken = json['access_token']?.toString();
	}
	if (json['token_type'] != null) {
		data.tokenType = json['token_type']?.toString();
	}
	if (json['expires_in'] != null) {
		data.expiresIn = json['expires_in']?.toInt();
	}
	if (json['refresh_token'] != null) {
		data.refreshToken = json['refresh_token']?.toString();
	}
	if (json['scope'] != null) {
		data.scope = json['scope']?.toString();
	}
	return data;
}

Map<String, dynamic> tokenEntityToJson(TokenEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['access_token'] = entity.accessToken;
	data['token_type'] = entity.tokenType;
	data['expires_in'] = entity.expiresIn;
	data['refresh_token'] = entity.refreshToken;
	data['scope'] = entity.scope;
	return data;
}